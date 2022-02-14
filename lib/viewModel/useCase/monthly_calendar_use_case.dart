import 'package:get/get.dart';
import 'package:rainbow1872/viewModel/state/monthly_calendar_state.dart';

class MonthlyCalendarUseCase extends GetxController {
  final Rx<MonthlyCalenderState> state = MonthlyCalenderState(focusDay: DateTime.now(), selectDay: DateTime.now()).obs;

  void onFocusDay(DateTime focus, DateTime select) {
    state.value = state.value.copyWith(focusDay: focus);
    state.value = state.value.copyWith(selectDay: select);
  }
}