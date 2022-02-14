import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow1872/utils/lesson_tile.dart';
import 'package:rainbow1872/utils/my_drawer.dart';
import 'package:rainbow1872/viewModel/lesson_review_view_model.dart';

import '../../main.dart';

class LessonReviewPage extends StatelessWidget {
  const LessonReviewPage({
    required this.isMissing,
    Key? key
  }) : super(key: key);

  final bool isMissing;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LessonReviewViewModel>(
      init: LessonReviewViewModel(isMissing: isMissing),
      builder: (context) {
        return Scaffold(
          drawer: MyDrawer(name: "최준호"),
          appBar: defaultAppBar(title: "레슨 리뷰"),
          body: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => buildLessonTile()),
        );
      }
    );
  }
}
