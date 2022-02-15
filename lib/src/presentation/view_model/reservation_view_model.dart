import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rainbow1872/src/domain/use_case/monthly_calendar_use_case.dart';

class ReservationViewModel extends GetxController {
  MonthlyCalendarUseCase calendarUseCase = MonthlyCalendarUseCase();

  final format = DateFormat("yy년 MM월 dd일");
  RxString now = "".obs;

  @override
  void onInit() {
    now.value = format.format(DateTime.now());
    calendarUseCase.selectDay.stream.listen((event) {
      now.value = format.format(event);
    });
    super.onInit();
  }

  Map<String, bool> timeTable = {
    "06:00" : false,
    "06:15" : false,
    "06:30" : false,
    "06:45" : false,
    "07:00" : false,
    "07:15" : false,
  };
}