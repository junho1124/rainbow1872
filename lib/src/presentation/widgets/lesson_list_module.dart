import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow1872/src/data/models/lesson.dart';
import 'package:rainbow1872/src/presentation/widgets/tiles/lesson_state_card.dart';

class LessonListModule extends StatelessWidget {
  const LessonListModule({
    Key? key,
    required this.matchLessons,
  }) : super(key: key);

  final List<Lesson> matchLessons;

  @override
  Widget build(BuildContext context) {
    return Obx(() => matchLessons.isEmpty
        ? Image.asset("assets/banner_no_lesson.png", width: context.width * 0.4,)
        : SizedBox(
      height: 50,
      width: context.width - 50,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: matchLessons.length,
        itemBuilder: (context, index) =>
            buildLessonCard(matchLessons[index]),
      ),
    ));
  }
}
