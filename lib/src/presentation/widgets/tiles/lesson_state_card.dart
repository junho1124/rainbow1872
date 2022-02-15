import 'package:flutter/material.dart';

Widget buildLessonStateCard() {
  return Row(
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
  );
}
