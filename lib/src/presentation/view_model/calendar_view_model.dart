import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rainbow1872/src/domain/use_case/calendar_use_case.dart';

class CalendarViewModel extends GetxController {


  final CalendarUseCase calendarUseCase = CalendarUseCase();
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


}