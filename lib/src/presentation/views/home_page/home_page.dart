import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow1872/main.dart';
import 'package:rainbow1872/src/presentation/view_model/home_view_model.dart';
import 'package:rainbow1872/src/presentation/views/home_page/modules/missing_lesson_module.dart';
import 'package:rainbow1872/src/presentation/widgets/my_drawer.dart';
import 'modules/banner_module.dart';
import 'modules/weekly_calendar_module.dart';
import 'modules/home_icons_module.dart';
import 'modules/location_state_module.dart';
import '../../widgets/user_info_module.dart';

class HomePage extends StatelessWidget {
  static const PATH = "/HomePage";
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
        init: HomeViewModel(),
        builder: (viewModel) {
          return SafeArea(
            top: true,
            bottom: true,
            child: Scaffold(
              drawer: MyDrawer(),
              appBar: defaultAppBar(title: "홈"),
              body: Obx(() => viewModel.isLoaded.isTrue ? SingleChildScrollView(
                child: Column(
                  children: [
                    LocationStateModule(viewModel: viewModel),
                    BannerModule(banners: viewModel.banners),
                    UserInfoModule(user: viewModel.user, manager: viewModel.manager),
                    MissingLessonModule(missingLessons: viewModel.missingLessons),
                    WeeklyCalendarModule(useCase: viewModel.calendarUseCase, matchLessons: viewModel.matchLessons,),
                    SizedBox(height: 20),
                    HomeIconsModule(assets: viewModel.assets, titles: viewModel.titles,)
                  ],
                ),
              ) : Container()),
              // floatingActionButton: InkWell(
              //   onTap: () {
              //     viewModel.addSample();
              //   },
              //     child: Icon(Icons.add_circle_outline_outlined)),
            ),
          );
        });
  }


}






