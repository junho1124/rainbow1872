import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:rainbow1872/src/data/models/manager.dart';
import 'package:rainbow1872/src/data/models/user.dart';
import 'package:rainbow1872/src/domain/use_case/calendar_use_case.dart';

class CalendarViewModel extends GetxController {
  final CalendarUseCase calendarUseCase = CalendarUseCase();

  final _userBox = GetStorage(User.boxName);
  final _managerBox = GetStorage(Manager.boxName);

  User? user;
  Manager? manager;

  final format = DateFormat("yy년 MM월 dd일");
  RxString now = "".obs;
  RxBool isLoaded = false.obs;

  @override
  void onInit() {
    user = _userBox.read(User.boxName);
    manager = _managerBox.read(Manager.boxName);
    now.value = format.format(DateTime.now());
    calendarUseCase.onInit();
    calendarUseCase.selectDay.stream.listen((event) {
      now.value = format.format(event);
    });
    isLoaded.value = true;
    super.onInit();
  }


}