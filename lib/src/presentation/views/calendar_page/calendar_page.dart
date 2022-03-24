import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow1872/main.dart';
import 'package:rainbow1872/src/presentation/view_model/calendar_view_model.dart';
import 'package:rainbow1872/src/presentation/widgets/lesson_list_module.dart';
import 'package:rainbow1872/src/presentation/widgets/monthly_calrendar.dart';
import 'package:rainbow1872/src/presentation/widgets/my_drawer.dart';
import 'package:rainbow1872/src/presentation/widgets/tiles/lesson_tile.dart';

class CalendarPage extends StatelessWidget {
  static const String PATH = "/CalendarPage";
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalendarViewModel>(
        init: CalendarViewModel(),
        builder: (viewModel) {
          return Scaffold(
            drawer: MyDrawer(),
            appBar: defaultAppBar(title: "일정 확인하기"),
            body: viewModel.isLoaded.isTrue ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: MonthlyCalendarModule(useCase: viewModel.calendarUseCase),
                ),
                Flexible(
                  child: SingleChildScrollView(
                    child: Container(
                      height: context.height * 0.6,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Divider(color: Colors.black),
                          Obx(() => Text(viewModel.now.value)),
                          buildLessonTile(user: viewModel.user!, manager: viewModel.manager!),
                          Expanded(child: LessonListModule(matchLessons: viewModel.calendarUseCase.dayLessons)),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ) : Container(),
          );
        });
  }
}

