import 'package:flutter/material.dart';

Widget buildLessonTile() {
  return Container(
    height: 120,
    width: double.infinity,
    padding: EdgeInsets.all(8),
    margin: EdgeInsets.all(8),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
            color: Colors.grey,
            offset: Offset(0.5, 0.5),
            blurRadius: 0.5)
      ],
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "나의 레슨 정보",
          style:
          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 8),
        SizedBox(
          height: 70,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("• 담당 프로 : ~~~~"),
                Text("• 남은 이용 기간 : ~~~~"),
                Text("• 남은 레슨 횟수 : ~~회"),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}