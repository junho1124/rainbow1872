import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:rainbow1872/src/data/models/lesson.dart';
import 'package:rainbow1872/src/domain/use_case/calendar_use_case.dart';
import 'package:rainbow1872/src/presentation/widgets/tiles/lesson_state_card.dart';
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
    return Column(
      children: [
        SizedBox(
          width: context.width,
          height: 150,
          child: Obx(() => TableCalendar(
                firstDay: DateTime.utc(2010),
                lastDay: DateTime.utc(2050),
                focusedDay: useCase.focusDay.value,
                locale: "ko_KR",
                calendarFormat: CalendarFormat.week,
                availableCalendarFormats: {CalendarFormat.week: "week"},
                headerStyle: HeaderStyle(titleCentered: true),
                onDaySelected: (select, focusDay) {
                  if (!isSameDay(useCase.selectDay.value, select)) {
                    useCase.onFocusDay(focusDay, select);
                  }
                },
                selectedDayPredicate: (day) {
                  return isSameDay(useCase.selectDay.value, day);
                },
              )),
        ),
        Obx(() => matchLessons.isEmpty
            ? buildNoLessonCard()
            : SizedBox(
          height: context.height * 0.15,
              width: context.width,
              child: ListView.builder(
          shrinkWrap: true,
          itemCount: matchLessons.length,
                  itemBuilder: (context, index) =>
                      buildLessonCard(matchLessons[index]),
                ),
            )),
      ],
    );
  }
}
