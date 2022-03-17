import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow1872/src/core/utils/log.dart';
import 'package:rainbow1872/src/data/models/lesson.dart';
import 'package:rainbow1872/src/data/repositoris/lesson_repository.dart';
import 'package:rainbow1872/src/domain/use_case/calendar_use_case.dart';

class ReservationViewModel extends GetxController {
  final _lessonRepository = LessonRepository();

  CalendarUseCase calendarUseCase = CalendarUseCase();

  final _memoController = TextEditingController();


  @override
  void onInit() async {
    await calendarUseCase.onInit();
    super.onInit();
  }



  void showReservationDialog(BuildContext context, int index) {
    Rx<Duration> duration = Duration(minutes: 15).obs;
    final offset = Duration(minutes: 15);
    Get.defaultDialog(
      title: "${calendarUseCase.now} 오전 ${calendarUseCase.timeTable[index].duration.inHours} : ${calendarUseCase.timeTable[index].duration.inMinutes % 60}",
      content: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(0.5, 0.5), blurRadius: 0.5)],
                color: Colors.white
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    if(duration.value.inMinutes > 15) {
                      duration.value -= offset;
                    }
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
                Obx((() => Text("${duration.value.inMinutes}분", style: TextStyle(fontWeight: FontWeight.w500)))),
                IconButton(
                  onPressed: () {
                    if(duration.value.inMinutes < 60) {
                      duration.value += offset;
                    }
                  },
                  icon: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Text("메모 사항"),
          SizedBox(height: 8),
          Container(
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey)
            ),
            child: TextField(
              controller: _memoController,
              decoration: InputDecoration(
                  border: InputBorder.none
              ),
            ),
          )
        ],
      ),
      confirm: InkWell(
        onTap: () async {
          await confirmDialog(index, duration.value).then((value) {
            if(value) Get.back();
          });
        },
        child: Container(
          width: context.width * 0.3,
          padding: EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.purple
          ),
          child: Center(child: Text("레슨 예약",style: TextStyle(color: Colors.white),)),
        ),
      ),
      cancel: InkWell(
        onTap: Get.back,
        child: Container(
          width: context.width * 0.3,
          padding: EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.red
          ),
          child: Center(child: Text("취소",style: TextStyle(color: Colors.white),)),
        ),
      ),
    );
  }


  Future<bool> confirmDialog(int index, Duration lessonTime) async {
    bool result = false;
    return await Get.defaultDialog(
      title: "에약하기",
      middleText: "${calendarUseCase.manager!.name} 프로님에게 예약을\n요청 하시겠습니까?",
      textConfirm: "요청하기",
      textCancel: "취소",
      onCancel: Get.back,
      onConfirm: () async {
        Log.d("확인");
        final selectDay = calendarUseCase.selectDay.value;
        final lesson = Lesson(
            checkedTime: 0,
            coachUid: calendarUseCase.manager!.uid,
            lessonDateTime: DateTime(selectDay.year, selectDay.month, selectDay.day, calendarUseCase.timeTable[index].duration.inMinutes ~/ 60, calendarUseCase.timeTable[index].duration.inMinutes % 60).millisecondsSinceEpoch,
            lessonMemo: _memoController.text,
            lessonNote: "",
            lessontime: lessonTime.inMilliseconds,
            memberChecked: false,
            type: "레슨",
            uid: calendarUseCase.user!.uid,
        );
        await _lessonRepository.add(lesson, calendarUseCase.manager!.name).then((value) async {
          _memoController.clear();
          calendarUseCase.lessons.clear();
          calendarUseCase.lessons.addAll(await _lessonRepository.getAll(calendarUseCase.user!.uid));
          calendarUseCase.setTimeTable(calendarUseCase.selectDay.value);
          result = true;
          Get.back();
        });
      },
      confirmTextColor: Colors.grey,
      cancelTextColor: Colors.grey,
      buttonColor: Colors.transparent
    ).then((value) => result);
  }
}