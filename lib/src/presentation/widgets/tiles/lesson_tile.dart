import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rainbow1872/src/data/models/manager.dart';
import 'package:rainbow1872/src/data/models/user.dart';

Widget buildLessonTile({required User user, required Manager manager}) {
  final format = DateFormat("yy년 MM월 dd일");
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
                Text("• 담당 프로 : ${manager.name}"),
                Text("• 남은 이용 기간 : ${format.format(DateTime.fromMillisecondsSinceEpoch(user.lessonMembershipStart))} ~ ${format.format(DateTime.fromMillisecondsSinceEpoch(user.lessonMembershipEnd))}"),
                Text("• 남은 레슨 횟수 : ${user.lessonMembership - user.lessonMembershipUsed}"),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}