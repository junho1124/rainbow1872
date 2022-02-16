import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rainbow1872/src/domain/use_case/calendar_use_case.dart';

class ReservationViewModel extends GetxController {
  CalendarUseCase calendarUseCase = CalendarUseCase();

  final format = DateFormat("yy년 MM월 dd일");
  final _controller = TextEditingController();
  RxString now = "".obs;

  Map<String, bool> timeTable = {
    "06:00" : false,
    "06:15" : false,
    "06:30" : false,
    "06:45" : false,
    "07:00" : false,
    "07:15" : false,
  };
  @override
  void onInit() {
    now.value = format.format(DateTime.now());
    calendarUseCase.selectDay.stream.listen((event) {
      now.value = format.format(event);
    });
    super.onInit();
  }

  void showReservationDialog(BuildContext context, int index) {
    Get.defaultDialog(
      title: "${now} 오전 ${timeTable.keys.toList()[index]}",
      content: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(0.5, 0.5), blurRadius: 0.5)],
                color: Colors.white
            ),
            child: Center(child: Text("15분", style: TextStyle(fontWeight: FontWeight.w500))),
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
              controller: _controller,
              decoration: InputDecoration(
                  border: InputBorder.none
              ),
            ),
          )
        ],
      ),
      confirm: InkWell(
        onTap: () {
          confirmDialog();
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


  void confirmDialog() {
    Get.defaultDialog(
      title: "에약하기",
      middleText: "최준호 프로님에게 예약을\n요청 하시겠습니까?",
      textConfirm: "요청하기",
      textCancel: "취소",
      onCancel: Get.back,
      onConfirm: () {

      },
      confirmTextColor: Colors.grey,
      cancelTextColor: Colors.grey,
      buttonColor: Colors.transparent
    );
  }
}