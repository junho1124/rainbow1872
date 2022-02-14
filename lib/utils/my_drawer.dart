import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow1872/view/home_page/home_page.dart';
import 'package:rainbow1872/view/lesson_review_page/lesson_review_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    required this.name,
    Key? key,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Drawer(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xA4A871FD), Colors.lightBlueAccent],
                  stops: [0.2, 0.6])),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "반갑습니다\n$name 회원님",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 30,
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  buildDrawerTile("홈", () {
                    Get.to(const HomePage());
                    Get.back();
                  }),
                  buildDrawerTile("캘린더", () {}),
                  buildDrawerTile("레슨 리뷰", () => Get.to(LessonReviewPage())),
                  buildDrawerTile("미확인 레슨 리뷰", () {}),
                  buildDrawerTile("에슨 예약하기", () {}),
                  buildDrawerTile("스윙 모션", () {}),
                  buildDrawerTile("매장 현황", () {}),
                  buildDrawerTile("내정보", () {}),
                  buildDrawerTile("로그아웃", () {}),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  InkWell buildDrawerTile(String title, VoidCallback onTap) {
    return InkWell(
      onTap: () {
        onTap.call();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w200),
        ),
      ),
    );
  }
}
