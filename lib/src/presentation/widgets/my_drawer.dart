import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow1872/src/presentation/views/account_page/account_page.dart';
import 'package:rainbow1872/src/presentation/views/calendar_page/calendar_page.dart';
import 'package:rainbow1872/src/presentation/views/home_page/home_page.dart';
import 'package:rainbow1872/src/presentation/views/lesson_review_page/lesson_review_page.dart';
import 'package:rainbow1872/src/presentation/views/reservation_page/reservation_page.dart';
import 'package:rainbow1872/src/presentation/views/signup_page/signup_page.dart';
import 'package:rainbow1872/src/presentation/views/store_state_page/store_state_page.dart';

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
                  buildDrawerTile("홈", () => Get.offNamed(HomePage.PATH)),
                  buildDrawerTile("캘린더", () => Get.offNamed(CalendarPage.PATH)),
                  buildDrawerTile("레슨 리뷰", () => Get.offNamed(LessonReviewPage.PATH)),
                  buildDrawerTile("미확인 레슨 리뷰", () => Get.offNamed(LessonReviewPage.MissingPATH)),
                  buildDrawerTile("레슨 예약하기", () => Get.offNamed(ReservationPage.PATH)),
                  // buildDrawerTile("스윙 모션", () => openImpactVision()),
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
  
  Future openImpactVision() async {
    print("0123");
    print(await LaunchApp.isAppInstalled(iosUrlScheme: "kakaotalk://"));
    await LaunchApp.openApp(
        iosUrlScheme: "kakaotalk://",
      appStoreLink: "https://apps.apple.com/kr/app/myiv/id1522298004",
      openStore: true
    );
    // if(await LaunchApp.isAppInstalled(iosUrlScheme: "MyIV://") == 1) {
    //   launch("MyIV://");
    // }
  }
}
