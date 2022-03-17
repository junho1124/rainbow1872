import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:rainbow1872/src/config/themes/app_theme.dart';
import 'package:rainbow1872/src/data/models/lesson.dart';
import 'package:rainbow1872/src/domain/use_case/calendar_use_case.dart';
import 'package:rainbow1872/src/presentation/widgets/lesson_list_module.dart';
import 'package:table_calendar/table_calendar.dart';

class WeeklyCalendarModule extends StatelessWidget {
  const WeeklyCalendarModule({
    required this.useCase,
    required this.matchLessons,
    Key? key,
  }) : super(key: key);

  final CalendarUseCase useCase;
  final List<Lesson> matchLessons;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      width: context.width,
      height: 200,
      child: Obx(() => useCase.isInit.value
          ? Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          border: Border.all(color: AppTheme.mainAppColor)
        ),
            child: Column(
              children: [
                TableCalendar(
                  firstDay: DateTime.utc(2010),
                  lastDay: DateTime.utc(2050),
                  focusedDay: useCase.focusDay.value,
                  weekendDays: [7],
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekendStyle: TextStyle(color: Colors.red, fontSize: 8),
                    weekdayStyle: TextStyle(fontSize: 8)
                  ),
                  locale: "ko_KR",
                  calendarFormat: CalendarFormat.week,
                  availableCalendarFormats: const {CalendarFormat.week: "week"},
                  calendarStyle: const CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: Colors.transparent
                    ),
                    todayTextStyle: TextStyle(color: Colors.black, fontSize: 8),
                    selectedDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppTheme.mainAppColor
                    ),
                    selectedTextStyle: TextStyle(fontSize: 8, color: Colors.white),
                    weekendTextStyle: TextStyle(color: Colors.red, fontSize: 8),
                    defaultTextStyle: TextStyle(fontSize: 8),
                    markerDecoration: BoxDecoration(
                      color: Colors.deepOrange,
                      shape: BoxShape.circle
                    ),
                  ),
                  headerStyle: HeaderStyle(
                    titleCentered: true,
                    decoration: BoxDecoration(
                      color: AppTheme.mainAppColor,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
                    ),
                    headerPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    headerMargin: EdgeInsets.only(bottom: 12),
                    titleTextStyle: TextStyle(color: Colors.white),
                    formatButtonVisible: false,
                    leftChevronIcon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 18),
                    rightChevronIcon: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18),
                  ),
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
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22),
                  child: Divider(color: Colors.grey),
                ),
                LessonListModule(matchLessons: matchLessons)
              ],
            ),
          )
          : Container()),
    );
  }
}
