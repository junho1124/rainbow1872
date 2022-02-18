import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow1872/main.dart';
import 'package:rainbow1872/src/presentation/view_model/reservation_view_model.dart';
import 'package:rainbow1872/src/presentation/widgets/monthly_calrendar.dart';
import 'package:rainbow1872/src/presentation/widgets/my_drawer.dart';

class ReservationPage extends StatelessWidget {
  static const String PATH = "/ReservationPage";

  const ReservationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReservationViewModel>(
        init: ReservationViewModel(),
        builder: (viewModel) {
          return Scaffold(
            drawer: MyDrawer(),
            appBar: defaultAppBar(title: "예약"),
            body: Column(
              children: [
                MonthlyCalendarModule(useCase: viewModel.calendarUseCase),
                Divider(
                  color: Colors.black,
                ),
                Obx(() => Text("최준호 프로님 / ${viewModel.calendarUseCase.now}",
                    style:
                    TextStyle(fontSize: 22, fontWeight: FontWeight.w500))),
                Obx(() => Expanded(
                      child: viewModel.calendarUseCase.unReservable.isFalse
                          ? ListView.builder(
                              shrinkWrap: true,
                              controller: viewModel.calendarUseCase.scrollController,
                              itemCount: viewModel.calendarUseCase.timeTable.length,
                              itemBuilder: (context, index) => Container(
                                    alignment: Alignment.center,
                                    height: 50,
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "${viewModel.calendarUseCase.timeTable[index].duration.inHours} : ${(viewModel.calendarUseCase.timeTable[index].duration.inMinutes % 60).bitLength == 0 ? "00" : (viewModel.calendarUseCase.timeTable[index].duration.inMinutes % 60)}",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            if (viewModel.calendarUseCase.timeTable[index]
                                                    .isAvailable &&
                                                !viewModel.calendarUseCase.timeTable[index]
                                                    .isReserved) {
                                              viewModel.showReservationDialog(
                                                  context, index);
                                            }
                                          },
                                          child: Container(
                                            height: 40,
                                            width: context.width * 0.6,
                                            decoration: BoxDecoration(
                                                color: viewModel
                                                        .calendarUseCase.timeTable[index]
                                                        .isReserved
                                                    ? Colors.blue
                                                    : viewModel.calendarUseCase.timeTable[index]
                                                            .isAvailable
                                                        ? Colors.blueGrey
                                                        : Colors.red),
                                            child: Center(
                                                child: Text(
                                              viewModel.calendarUseCase.timeTable[index]
                                                      .isReserved
                                                  ? "레슨 예약됨"
                                                  : viewModel.calendarUseCase.timeTable[index]
                                                          .isAvailable
                                                      ? "예약하기"
                                                      : "예약불가",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            )),
                                          ),
                                        )
                                      ],
                                    ),
                                  ))
                          : Container(
                        padding: EdgeInsets.symmetric(vertical: 16),
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Expanded(
                                      child: Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 30),
                                          width: double.infinity,
                                          child: Image.asset(
                                            "assets/banner_unable_reserve.png",
                                            fit: BoxFit.cover,
                                          ))),
                                  const Text("선택하신 날자는 예약이 불가능합니다.",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500))
                                ],
                              ),
                            ),
                    ))
              ],
            ),
          );
        });
  }
}
