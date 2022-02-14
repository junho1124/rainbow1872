import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class CalendarModule extends StatelessWidget {
  const CalendarModule({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: context.width,
          height: 120,
          child: Calendar(
            weekDays: ["일", "월", "화", "수", "목", "금", "토"],
            isExpandable: false,
            locale: "ko_KR",
            expandableDateFormat: 'MM월 YYYY',
            todayButtonText: "",
          ),
        ),
        Row(
          children: [
            Image.asset(
              "assets/icon_lesson.png",
              height: 80,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "해당 일에 레슨 기록이 없네요!",
                  style: TextStyle(color: Colors.deepPurpleAccent),
                ),
                SizedBox(
                  height: 8,
                ),
                Text("레슨 상담은 담당 프로님께 말씀 해 주세요")
              ],
            )
          ],
        ),
      ],
    );
  }
}
