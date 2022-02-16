import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rainbow1872/src/data/models/user.dart';
import 'package:rainbow1872/src/presentation/views/account_page/account_page.dart';
import 'package:rainbow1872/src/presentation/views/calendar_page/calendar_page.dart';
import 'package:rainbow1872/src/presentation/views/home_page/home_page.dart';
import 'package:rainbow1872/src/presentation/views/lesson_review_page/lesson_review_page.dart';
import 'package:rainbow1872/src/presentation/views/reservation_page/reservation_page.dart';
import 'package:rainbow1872/src/presentation/views/signup_page/signup_page.dart';
import 'package:rainbow1872/src/presentation/views/store_state_page/store_state_page.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({
    Key? key,
  }) : super(key: key);

  final _userBox = GetStorage(User.boxName);

  @override
  Widget build(BuildContext context) {
    final User user = _userBox.read(User.boxName);
    final name = user.name;
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
                  buildDrawerTile("홈", () => Get.offNamed(HomePage.PATH)),
                  buildDrawerTile("캘린더", () => Get.offNamed(CalendarPage.PATH)),
                  buildDrawerTile("레슨 리뷰", () => Get.offNamed(LessonReviewPage.PATH)),
                  buildDrawerTile("미확인 레슨 리뷰", () => Get.offNamed(LessonReviewPage.MissingPATH)),
                  buildDrawerTile("레슨 예약하기", () => Get.offNamed(ReservationPage.PATH)),
                  buildDrawerTile("스윙 모션", () => openImpactVision()),
                  buildDrawerTile("매장 현황", () => Get.offNamed(StoreStatePage.PATH)),
                  buildDrawerTile("내정보", () => Get.offNamed(AccountPage.PATH)),
                  buildDrawerTile("로그아웃", () => Get.offNamed(SignupPage.PATH)),
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
Future openImpactVision() async {
  if(await canLaunch("https://apps.apple.com/kr/app/myiv/id1522298004")) {
    launch("https://apps.apple.com/kr/app/myiv/id1522298004");
  }
}
