import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:rainbow1872/src/data/models/lesson.dart';

Widget buildNoLessonCard(BuildContext context) {
  return Row(
    children: [
      Image.asset(
        "assets/icon_lesson.png",
        height: 80,
      ),
      SizedBox(
        width: context.width - 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "해당 일에 레슨 기록이 없네요!",
              style: TextStyle(color: Colors.deepPurpleAccent),
            ),
            SizedBox(
              height: 8,
            ),
            Text("레슨 상담은 담당 프로님께 말씀 해 주세요", )
          ],
        ),
      )
    ],
  );
}

Widget buildLessonCard(Lesson lesson) {
  final format = DateFormat("yy년 MM월 dd일 HH시 mm분");
  return Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: Row(
      children: [
        Image.asset(
          "assets/icon_lesson.png",
          height: 80,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "레슨 예약 내역",
              style: TextStyle(color: Colors.deepPurpleAccent),
            ),
            SizedBox(
              height: 8,
            ),
            Text("${format.format(DateTime.fromMillisecondsSinceEpoch(lesson.lessonDateTime))}에\n레슨 일정이 예약되어 있습니다.")
          ],
        )
      ],
    ),
  );
}
