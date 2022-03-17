import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:intl/intl.dart';
import 'package:rainbow1872/src/config/themes/app_theme.dart';
import 'package:rainbow1872/src/data/models/branch.dart';
import 'package:rainbow1872/src/data/models/manager.dart';
import 'package:rainbow1872/src/data/models/user.dart';

class UserInfoModule extends StatelessWidget {
  const UserInfoModule({
    required this.user,
    required this.manager,
    required this.branch,
    Key? key,
  }) : super(key: key);

  final User user;
  final Manager manager;
  final Branch branch;

  @override
  Widget build(BuildContext context) {
    final format = DateFormat("yy.MM.dd");
    return Container(
      color: Colors.white,
      width: context.width,
      height: 120,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 80,
                  width: 80,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(user.profileImg ?? ""),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text(user.name, style: TextStyle(color: AppTheme.mainTextColor, fontSize: 12,fontWeight: FontWeight.bold)),
                    const Text("회원", style: TextStyle(color: AppTheme.mainTextColor, fontSize: 10))
                ],)
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text("•잔여 레슨:", style: TextStyle(color: AppTheme.mainTextColor, fontSize: 10, fontWeight: FontWeight.bold)),
                      Text("${user.lessonMembership - user.lessonMembershipUsed}", style: TextStyle(color: AppTheme.mainTextColor, fontSize: 10)),
                      const Text("회", style: TextStyle(color: AppTheme.mainTextColor, fontSize: 10, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("•레슨 기간:", style: TextStyle(color: AppTheme.mainTextColor, fontSize: 10, fontWeight: FontWeight.bold)),
                      Text("  ${format.format(DateTime.fromMillisecondsSinceEpoch(user.lessonMembershipStart))} ~ ${format.format(DateTime.fromMillisecondsSinceEpoch(user.lessonMembershipEnd))}", style: TextStyle(color: AppTheme.mainTextColor, fontSize: 10)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          const Text("•레슨 지점:", style: TextStyle(color: AppTheme.mainTextColor, fontSize: 10, fontWeight: FontWeight.bold)),
                          Text("  ${user.branch}점", style: TextStyle(color: AppTheme.mainTextColor, fontSize: 10)),
                        ],
                      ),
                      const SizedBox(width: 12),
                      Container(
                        width: 44,
                        height: 16,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppTheme.mainAppColor),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: switchStatusColor(branch.status),
                              ),
                            ),
                            Text(switchStatusText(branch.status), style: TextStyle(color: AppTheme.mainTextColor, fontSize: 10, fontWeight: FontWeight.bold))
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Color switchStatusColor(String state) {
  switch(state) {
    case "low" :
      return AppTheme.stateGreen;
    case "middle" :
      return Colors.yellow;
    case "high" :
      return Colors.red;
    default :
      return Colors.yellow;
  }
}

String switchStatusText(String state) {
  switch(state) {
    case "low" :
      return "쾌적";
    case "middle" :
      return "보통";
    case "high" :
      return "복잡";
    default :
      return "보통";
  }
}

