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
          drawer: MyDrawer(name: "최준호"),
          appBar: defaultAppBar(title: "예약"),
          body: Column(
            children: [
              MonthlyCalendarModule(useCase: viewModel.calendarUseCase),
              Divider(color: Colors.black,),
              Text("최준호 프로님 / ${viewModel.now}", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: viewModel.timeTable.length,
                    itemBuilder: (context, index) => Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                      Text(viewModel.timeTable.keys.toList()[index], style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                      Container(
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(
                          color: viewModel.timeTable.values.toList()[index] ? Colors.blueGrey : Colors.red
                        ),
                        child: Center(child: Text(viewModel.timeTable.values.toList()[index] ? "예약하기" : "예약불가", style: TextStyle(color: Colors.white,fontSize: 16),)),)
                    ],),)),
              )
            ],
          ),
        );
      }
    );
  }
}
