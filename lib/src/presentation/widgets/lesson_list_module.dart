import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rainbow1872/src/core/utils/log.dart';
import 'package:rainbow1872/src/data/models/lesson.dart';
import 'package:rainbow1872/src/domain/use_case/check_lesson_use_case.dart';
import 'package:rainbow1872/src/presentation/widgets/tiles/lesson_state_card.dart';

class LessonListModule extends StatelessWidget {
  const LessonListModule({
    Key? key,
    required this.matchLessons,
  }) : super(key: key);

  final RxList<Lesson> matchLessons;

  @override
  Widget build(BuildContext context) {
    final fullFormat = DateFormat("yyyy년 MM월 dd일");
    final CheckLessonUseCase useCase = CheckLessonUseCase();
    Log.d(matchLessons);
    return Obx(() => matchLessons.isEmpty
        ? Align(
      alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Image.asset(
                "assets/banner_no_lesson.png",
              ),
          ),
        )
        : SizedBox(
            height: 50,
            width: context.width,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: matchLessons.length,
                itemBuilder: (context, index) {
                  final day = DateTime.fromMillisecondsSinceEpoch(
                      matchLessons[index].lessonDateTime);
                  return DateTime.now().month == day.month && DateTime.now().day <= day.day
                      ? buildLessonCard(matchLessons[index])
                      : matchLessons[index].memberChecked
                      ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80.0),
                    child: Text("해당 날자의 모든 레슨을 확인 하셨습니다.", textAlign: TextAlign.center,),
                  )
                      : Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          Container(
                            width: context.width,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(),
                            ),
                            child: Center(
                              child: Text(matchLessons[index].lessonNote),
                            ),
                          ),
                          SizedBox(height: 8),
                          InkWell(
                            onTap: () {
                              Get.defaultDialog(
                                  title: "레슨 확인",
                                  middleText: "${fullFormat.format(DateTime.fromMillisecondsSinceEpoch(matchLessons[index].lessonDateTime))} 레슨을 확인 하시겠습니까?",
                                  textConfirm: "확인",
                                  textCancel: "취소",
                                  onConfirm: () async {
                                    await useCase.call(matchLessons[index]).then((value) => Get.back());
                                  }
                              );
                            },
                            child: Container(
                              width: context.width,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.deepPurpleAccent,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  "확인 하기",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ));
  }
}
