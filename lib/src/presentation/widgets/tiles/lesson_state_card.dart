import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rainbow1872/src/data/models/lesson.dart';


Widget buildLessonCard(Lesson lesson) {
  final format = DateFormat("yy년 MM월 dd일 HH시 mm분");
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: Row(
      children: [
        Image.asset(
          "assets/icon_lesson.png",
          height: 50,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "레슨 예약 내역",
              style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 10),
            ),
            Text("${format.format(DateTime.fromMillisecondsSinceEpoch(lesson.lessonDateTime))}에\n레슨 일정이 예약되어 있습니다.", style: TextStyle(fontSize: 8),)
          ],
        )
      ],
    ),
  );
}
