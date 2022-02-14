import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow1872/view/lesson_review_page/lesson_review_page.dart';

class HomeIconsModule extends StatelessWidget {
  const HomeIconsModule({
    Key? key,
    required this.assets,
    required this.titles
  }) : super(key: key);

  final List<String> assets;
  final List<String> titles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildHomeCard(context, assets[0], titles[0], () => Get.to(LessonReviewPage())),
            buildHomeCard(context, assets[1], titles[1], () => Get.to(LessonReviewPage())),
            buildHomeCard(context, assets[2], titles[2], () => Get.to(LessonReviewPage())),
            buildHomeCard(context, assets[3], titles[3], () => Get.to(LessonReviewPage())),
          ]
      ),
    );
  }
  Widget buildHomeCard(BuildContext context, String asset, String title, VoidCallback onTap) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: context.width * 0.2,
            width: context.width * 0.2,
            decoration: BoxDecoration(
                color: Color(0xFF89E5FC),
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Image.asset(asset),
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
