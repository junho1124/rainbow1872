import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:intl/intl.dart';
import 'package:rainbow1872/src/data/models/manager.dart';
import 'package:rainbow1872/src/data/models/user.dart';
import 'package:url_launcher/url_launcher.dart';

class UserInfoModule extends StatelessWidget {
  const UserInfoModule({
    required this.user,
    required this.manager,
    Key? key,
  }) : super(key: key);

  final User user;
  final Manager manager;

  @override
  Widget build(BuildContext context) {
    final format = DateFormat("yy년 MM월 dd일");
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              width: context.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        backgroundImage: NetworkImage(user.profileImg ?? ""),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user.name),
                        Text("남은 레슨 횟수: ${user.lessonMembership - user.lessonMembershipUsed}"),
                        Text("남은 레슨 기간: ${format.format(DateTime.fromMillisecondsSinceEpoch(user.lessonMembershipStart))} ~ ${format.format(DateTime.fromMillisecondsSinceEpoch(user.lessonMembershipEnd))}"),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 8,
              child: Row(
                children: [
                  InkWell(
                    onTap: () async {
                      await launch("tel://${manager.phone}");
                    },
                    child: Image.asset("assets/icon_call.png", height: 40),
                  ),
                  InkWell(
                    onTap: () async {
                      Get.defaultDialog(
                          title: "SMS 전송",
                          middleText: "${manager.name} 프로님에게 메세지를\n보내시겠습니까?",
                          textConfirm: "보내기",
                          onConfirm: () async {
                            await launch("sms://${manager.phone}");
                            Get.back();
                          },
                          textCancel: "취소",
                          buttonColor: Colors.transparent,
                          cancelTextColor: Colors.blueGrey,
                          confirmTextColor: Colors.blueGrey
                      );
                    },
                    child: Image.asset("assets/icon_chat.png", height: 40),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}

