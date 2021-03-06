import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:rainbow1872/src/core/utils/log.dart';
import 'package:rainbow1872/src/data/models/lesson.dart';
import 'package:rainbow1872/src/data/models/manager.dart';
import 'package:rainbow1872/src/data/models/manager_schedule.dart';
import 'package:rainbow1872/src/data/models/reserve_option.dart';
import 'package:rainbow1872/src/data/models/user.dart';
import 'package:rainbow1872/src/data/repositoris/lesson_repository.dart';
import 'package:rainbow1872/src/data/repositoris/manager_repository.dart';
import 'package:rainbow1872/src/data/repositoris/manager_schedule_repository.dart';
import 'package:rainbow1872/src/data/repositoris/reserve_option_repository.dart';
import 'package:rainbow1872/src/domain/entities/lesson_event.dart';

import '../../data/repositoris/user_repository.dart';

class CalendarUseCase extends GetxController {
  final _reserveOptionRepository = ReserveOptionRepository();
  final _managerScheduleRepository = ManagerScheduleRepository();
  final _lessonRepository = LessonRepository();
  final _managerRepository = ManagerRepository();
  final _userRepository = UserRepository();

  final _userBox = GetStorage(User.boxName);
  final _managerBox = GetStorage(Manager.boxName);

  final Rx<DateTime> focusDay = DateTime.now().obs;
  final Rx<DateTime> selectDay = DateTime.now().obs;
  RxList<LessonEvent> timeTable = <LessonEvent>[].obs;
  RxList<LessonEvent> monthlyTimetable = <LessonEvent>[].obs;

  final scrollController = ScrollController();


  User? user;
  Manager? manager;
  ReserveOption? _option;

  RxString now = "".obs;
  RxBool unReservable = false.obs;
  RxBool isInit = false.obs;

  List<Lesson> lessons = [];
  RxList<Lesson> dayLessons = <Lesson>[].obs;
  Map<int, ManagerSchedule> managerSchedules = {};

  final format = DateFormat("yy년 MM월 dd일");



  @override
  Future onInit() async {
    final User _user = _userBox.read(User.boxName);
    user = await _userRepository.getByUid(_user.uid);
    final Manager _manager = _managerBox.read(Manager.boxName);
    manager = await _managerRepository.get(_manager.uid);
    _option = await _reserveOptionRepository.get(user!.ableReservation);
    lessons.addAll(await _lessonRepository.getAll(user!.uid));
    dayLessons.addAll(lessons.where((element) {
      final lessonTime = DateTime
          .fromMillisecondsSinceEpoch(element.lessonDateTime);
      return
        DateTime(lessonTime.year, lessonTime.month, lessonTime.day) == DateTime(selectDay.value.year, selectDay.value.month, selectDay.value.day);
    }));
    managerSchedules.addAll(await _managerScheduleRepository.get(manager!.uid));
    now.value = format.format(DateTime.now());
    setTimeTable(DateTime.now());
    selectDay.stream.listen((event) {
      now.value = format.format(event);
      setTimeTable(event);
      dayLessons.clear();
      dayLessons.addAll(lessons.where((element) {
          final lessonTime = DateTime
              .fromMillisecondsSinceEpoch(element.lessonDateTime);
          return
            DateTime(lessonTime.year, lessonTime.month, lessonTime.day) == DateTime(event.year, event.month, event.day);
        }));
    });
    _lessonRepository.getStream(user!.uid).listen((event) {
      event.docChanges.forEach((element) {
        final update = Lesson.fromJson(element.doc.data()!);
        lessons.removeWhere((element) => element.lessonDateTime == update.lessonDateTime);
        lessons.add(update);
        setTimeTable(selectDay.value);
      });
    });
    isInit.value = true;
    super.onInit();
  }


  void onFocusDay(DateTime focus, DateTime select) {
    focusDay.value = focus;
    selectDay.value = select;
  }

  void setTimeTable(DateTime event) {
    timeTable.clear();
    if(manager!.closeToday != null) {
      if(manager!.closeToday != 0 && DateTime(event.year, event.month, event.day, 0).millisecondsSinceEpoch < manager!.closeToday! && manager!.closeToday! < DateTime(event.year, event.month, event.day, 23, 59).millisecondsSinceEpoch) {
        unReservable.value = true;
        return;
      }
    }
    if(event.month >= DateTime.now().month) {
      if(event.month == DateTime.now().month) {
        if (event.day < DateTime.now().day) {
          unReservable.value = true;
          return;
        }
        if (event.day == DateTime.now().day) {
          if(_option!.today == false) {
            unReservable.value = true;
            return;
          }
        }

      }
    } else {
      unReservable.value = true;
      return;
    }

    unReservable.value = false;

    Duration duration = const Duration(hours: 6, minutes: 0);
    do {
      bool isAvailable = true;
      bool isReserved = false;
      //예약이 가능한 시간인지 체크
      isAvailable = _checkIsAvailable(event, duration, isAvailable);

      isReserved = _checkIsReserved(event, duration, isReserved);

      timeTable.add(LessonEvent(duration: duration, lessonTime: event.add(duration), isReserved: isReserved, isAvailable: isAvailable));
      duration = duration + const Duration(minutes: 15);
    } while(duration.inHours < 24);
    // unReservable.value = timeTable.where((event) => event.isReserved).isNotEmpty;
    if(scrollController.positions.isNotEmpty) {
      scrollController.jumpTo(0);
    }
  }

  bool _checkIsReserved(DateTime event, Duration duration, bool isReserved) {
    for (var item in lessons.where((element) {
      final lessonTime = DateTime.fromMillisecondsSinceEpoch(element.lessonDateTime);
      return DateTime(lessonTime.year, lessonTime.month, lessonTime.day) == DateTime(event.year, event.month, event.day);
    }).toList()) {
      if(Duration(milliseconds: item.lessontime).inMinutes  == Duration(milliseconds: duration.inMilliseconds).inMinutes - const Duration(hours: 5, minutes: 45).inMinutes) {
        isReserved = true;
      }
    }
    return isReserved;
  }

  bool _checkIsAvailable(DateTime event, Duration duration, bool isAvailable) {
    //해당 요일의 스케쥴
    ManagerSchedule schedule = managerSchedules[DateTime.now().weekday]!;
    //옵션 상 예약 가능 한지 확인
    final nowTime = DateTime.now();
    //사전 예약 가능 날자 확인
    if((user!.lessonMembershipStart <= event.millisecondsSinceEpoch && event.millisecondsSinceEpoch <= user!.lessonMembershipEnd)) {
      isAvailable = true;
      //다른 달인지 체크
      Log.d("message");

      if(nowTime.month != event.month) {
        isAvailable = true;
        //업무 시간인지 체크
        if (!(schedule.workingStart <= duration.inMilliseconds &&
            duration.inMilliseconds < schedule.workingFinish)) {
          isAvailable = false;
        }
        //쉬는 시간인지 체크
        if (schedule.restStart != null) {
          if ((schedule.restStart! <= duration.inMilliseconds &&
              duration.inMilliseconds < schedule.restFinish!)) {
            isAvailable = false;
          }
        }
      } else if ((nowTime.day <= event.day)) {
          isAvailable = true;
          //사전 예약 가능 시간 확인
          if (!(nowTime.hour <= event.hour &&
              event.hour <= nowTime.hour + _option!.reserveTime)) {
            isAvailable = true;
          }
          //업무 시간인지 체크
          if (!(schedule.workingStart <= duration.inMilliseconds &&
              duration.inMilliseconds < schedule.workingFinish)) {
            isAvailable = false;
          }
          //쉬는 시간인지 체크
          if (schedule.restStart != null) {
            Log.d("${schedule.restStart!} ${duration.inMilliseconds}");
            if ((schedule.restStart! <= duration.inMilliseconds &&
                duration.inMilliseconds < schedule.restFinish!)) {
              isAvailable = false;
            }
          }
        }

    } else {
      isAvailable = false;
    }
    return isAvailable;
  }

  List<Lesson> getLessons(DateTime select) {
    return lessons.where((element) {
      final lessonTime = DateTime
          .fromMillisecondsSinceEpoch(element.lessonDateTime);
      return
          DateTime(lessonTime.year, lessonTime.month, lessonTime.day) == DateTime(select.year, select.month, select.day);
    }).toList().obs;
  }
}