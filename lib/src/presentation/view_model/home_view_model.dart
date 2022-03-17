import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:rainbow1872/src/config/themes/app_theme.dart';
import 'package:rainbow1872/src/data/models/banner.dart' as bn;
import 'package:rainbow1872/src/data/models/branch.dart';
import 'package:rainbow1872/src/data/models/lesson.dart';
import 'package:rainbow1872/src/data/models/manager.dart';
import 'package:rainbow1872/src/data/models/manager_schedule.dart';
import 'package:rainbow1872/src/data/models/user.dart';
import 'package:rainbow1872/src/data/repositoris/banner_repository.dart';
import 'package:rainbow1872/src/data/repositoris/branch_repository.dart';
import 'package:rainbow1872/src/data/repositoris/lesson_repository.dart';
import 'package:rainbow1872/src/data/repositoris/manager_repository.dart';
import 'package:rainbow1872/src/data/repositoris/manager_schedule_repository.dart';
import 'package:rainbow1872/src/domain/entities/manager_state.dart';
import 'package:rainbow1872/src/domain/use_case/calendar_use_case.dart';

class HomeViewModel extends GetxController {
  final _branchRepository = BranchRepository();
  final _bannerRepository = BannerRepository();
  final _managerRepository = ManagerRepository();
  final _lessonRepository = LessonRepository();
  final _managerScheduleRepository = ManagerScheduleRepository();

  final calendarUseCase = CalendarUseCase();

  final _userBox = GetStorage(User.boxName);

  late User user;
  late Branch branch;
  late List<bn.Banner> banners;
  late List<Lesson> lessons;
  late Manager manager;
  List<Lesson> missingLessons = [];
  RxList<Lesson> matchLessons = <Lesson>[].obs;
  Map<int, ManagerSchedule> managerSchedule = {};


  var isLoaded = false.obs;
  var storeState = "";

  @override
  void onInit() async {
    user = await _userBox.read(User.boxName);
    branch = await _branchRepository.get(user.branch);
    banners = await _bannerRepository.getAll();
    manager = await _managerRepository.get(user.proUid);
    lessons = await _lessonRepository.getAll(user.uid);
    managerSchedule.addAll(await _managerScheduleRepository.get(manager.uid));
    calendarUseCase.onInit();
    missingLessons.addAll(lessons.where((element) => !element.memberChecked));
    matchLessons.addAll(lessons.where((element) => DateTime.fromMillisecondsSinceEpoch(element.lessonDateTime).day == DateTime.now().day));
    calendarUseCase.selectDay.stream.listen((event) {
      matchLessons.clear();
      matchLessons.addAll(lessons.where((element) => DateTime.fromMillisecondsSinceEpoch(element.lessonDateTime).day == event.day));
    });
    await getStoreCondition();
    initializeDateFormatting();
    isLoaded.value = true;
    super.onInit();
  }

  Future getStoreCondition() async {
    switch(branch.status) {
      case "low" :
        return storeState = "쾌적";
      case "high" :
        return storeState = "복잡";
      default :
        return storeState = "보통";
   }
  }

  ManagerState getManagerState() {
    ManagerState result = ManagerState(stateColor: Colors.red, state: "근무 종료");
    final weekDay = DateTime.now().weekday;
    final schedule = managerSchedule[weekDay];
    final now = DateTime.now().millisecondsSinceEpoch;
    if(schedule!.workingStart <= now && now <= schedule.workingFinish) {
      result = ManagerState(stateColor: AppTheme.stateGreen, state: "현재 근무 중");
      if(schedule.restStart != null) {
        if (schedule.restStart! <= now && now <= schedule.restFinish!) {
          result = ManagerState(stateColor: Colors.yellow, state: "휴식 시간");
        }
      }
    }
    if(schedule.working != "work") {
      result = ManagerState(stateColor: Colors.black, state: "휴무일");
    }
    return result;
  }

  List<String> assets = [
    "assets/button_lesson_review.png",
    "assets/button_search.png",
    "assets/button_scan_swing.png",
    "assets/button_account.png",
    "assets/button_qr.png",
    "assets/button_help.png",
  ];
}