import 'package:get/get.dart';

class MonthlyCalendarUseCase {
  final Rx<DateTime> focusDay = DateTime.now().obs;
  final Rx<DateTime> selectDay = DateTime.now().obs;

  void onFocusDay(DateTime focus, DateTime select) {
    focusDay.value = focus;
    selectDay.value = select;
  }
}