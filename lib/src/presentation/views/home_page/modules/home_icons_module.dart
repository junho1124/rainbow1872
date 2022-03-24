import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow1872/src/data/models/user.dart';
import 'package:rainbow1872/src/presentation/views/account_page/account_page.dart';
import 'package:rainbow1872/src/presentation/views/lesson_review_page/lesson_review_page.dart';
import 'package:rainbow1872/src/presentation/views/store_state_page/store_state_page.dart';
import 'package:rainbow1872/src/presentation/widgets/dialogs/qr_dialog.dart';
import 'package:rainbow1872/src/presentation/widgets/my_drawer.dart';

class HomeIconsModule extends StatelessWidget {
  const HomeIconsModule({
    Key? key,
    required this.assets,
    required this.user,
    required this.onTapQR,
  }) : super(key: key);

  final List<String> assets;
  final User user;
  final VoidCallback onTapQR;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildHomeCard(context, assets[0], () => Get.toNamed(LessonReviewPage.PATH)),
              buildHomeCard(context, assets[1], () => Get.toNamed(StoreStatePage.PATH)),
              buildHomeCard(context, assets[2], () => openImpactVision()),
            ]
        ),
        SizedBox(height: 12),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildHomeCard(context, assets[3], () => Get.toNamed(AccountPage.PATH)),
              buildHomeCard(context, assets[4], () => showQRImage(user.uid, context, onTapQR)),
              buildHomeCard(context, assets[5], () {}),
            ]
        ),
      ],
    );
  }
  Widget buildHomeCard(BuildContext context, String asset, VoidCallback onTap) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: (context.width - 48) * 0.31,
            width: (context.width - 48) * 0.31,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Image.asset(asset),
            ),
          ),
        ),
      ],
    );
  }
}
