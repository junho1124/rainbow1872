import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:rainbow1872/src/presentation/widgets/tiles/lesson_state_card.dart';
import 'package:table_calendar/table_calendar.dart';

class WeeklyCalendarModule extends StatelessWidget {
  const WeeklyCalendarModule({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: context.width,
          height: 150,
          child: TableCalendar(
            firstDay: DateTime.utc(2010),
            lastDay: DateTime.utc(2050),
            focusedDay: DateTime.now(),
            locale: "ko_KR",
            calendarFormat: CalendarFormat.week,
            availableCalendarFormats: {CalendarFormat.week : "week"},
            headerStyle: HeaderStyle(titleCentered: true),
          ),
        ),
        buildLessonStateCard(),
      ],
    );
  }

}
