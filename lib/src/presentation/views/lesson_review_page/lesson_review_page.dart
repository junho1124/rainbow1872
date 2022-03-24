import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rainbow1872/main.dart';
import 'package:rainbow1872/src/presentation/view_model/lesson_review_view_model.dart';
import 'package:rainbow1872/src/presentation/widgets/my_drawer.dart';
import 'package:rainbow1872/src/presentation/widgets/tiles/lesson_tile.dart';


class LessonReviewPage extends StatelessWidget {
  static const String PATH = "/LessonReviewPage";
  const LessonReviewPage({
    Key? key
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetBuilder<LessonReviewViewModel>(
      init: LessonReviewViewModel(),
      builder: (viewModel) {
        final formatEvenTime = DateFormat("yy년 MM월 dd일 HH시 mm분");
        final formatEvenDay = DateFormat("yy년 MM월 \ndd일");
        return Scaffold(
          drawer: MyDrawer(),
          appBar: defaultAppBar(title: "레슨 리뷰"),
          body: Obx(() => viewModel.useCase.isLoaded.isTrue ? Column(
            children: [
              buildLessonTile(user: viewModel.useCase.user!.value, manager: viewModel.useCase.manager!),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: viewModel.useCase.lessons.length,
                    itemBuilder: (context, index) => Container(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Image.asset("assets/icon_lesson.png", height: context.width * 0.2,),
                          Expanded(child: Text("${formatEvenTime.format(DateTime.fromMillisecondsSinceEpoch(viewModel.useCase.lessons[index].lessonDateTime))}\n레슨 리뷰")),
                          InkWell(
                            onTap: () async => await viewModel.useCase.checkLesson(viewModel.useCase.lessons[index]) ,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFAE63F1),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              height: context.width * 0.2,
                              width: context.width * 0.22,
                              child: Center(
                                child: Text(viewModel.useCase.lessons[index].memberChecked ? "${formatEvenDay.format(DateTime.fromMillisecondsSinceEpoch(viewModel.useCase.lessons[index].checkedTime))}\n확인 완료" : "확인하기", style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
              ),
            ],
          ) : Container()),
        );
      }
    );
  }
}
