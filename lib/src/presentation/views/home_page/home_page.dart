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
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    LocationStateModule(),
                    BannerModule(),
                    UserInfoModule(),
                    MissingLessonModule(),
                    WeeklyCalendarModule(),
                    SizedBox(height: 20),
                    HomeIconsModule(assets: viewModel.assets, titles: viewModel.titles,)
                  ],
                ),
              ),
            ),
          );
        });
  }


}






