import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:rainbow1872/src/domain/use_case/calendar_use_case.dart';
import 'package:table_calendar/table_calendar.dart';

class MonthlyCalendarModule extends StatelessWidget {
  const MonthlyCalendarModule({
    required this.useCase,
    Key? key,
  }) : super(key: key);

  final CalendarUseCase useCase;

  @override
  Widget build(BuildContext context) {
    return Obx(() => useCase.isInit.value ? TableCalendar(
      firstDay: DateTime.utc(2010),
      lastDay: DateTime.utc(2050),
      focusedDay: useCase.focusDay.value,
      locale: "ko_KR",
      calendarFormat: CalendarFormat.month,
      availableCalendarFormats: {CalendarFormat.month: "month"},
      headerStyle: HeaderStyle(titleCentered: true),
      rowHeight: 40,
      onDaySelected: (select, focusDay) {
        if (!isSameDay(useCase.selectDay.value, select)) {
          useCase.onFocusDay(focusDay, select);
        }
      },
      selectedDayPredicate: (day) {
        return isSameDay(useCase.selectDay.value, day);
      },
      eventLoader: (select) {
        return useCase.getLessons(select);
      },
    ) : Container());
  }
}
