import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow1872/main.dart';
import 'package:rainbow1872/src/config/themes/app_theme.dart';
import 'package:rainbow1872/src/presentation/view_model/home_view_model.dart';
import 'package:rainbow1872/src/presentation/widgets/my_drawer.dart';
import 'modules/banner_module.dart';
import 'modules/manager_indo_module.dart';
import 'modules/weekly_calendar_module.dart';
import 'modules/home_icons_module.dart';
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
              appBar: defaultAppBar(title: "HOME"),
              backgroundColor: Colors.white,
              body: Obx(() => viewModel.isLoaded.isTrue ? SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black.withOpacity(0.05)
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        width: context.width * 0.55,
                          child: const Divider(color: AppTheme.mainAppColor, height: 0, thickness: 2)),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppTheme.mainAppColor)
                        ),
                        child: Column(
                          children: [
                            BannerModule(banners: viewModel.banners),
                            UserInfoModule(user: viewModel.user.value, manager: viewModel.manager, branch: viewModel.branch),
                            ManagerInfoModule(manager: viewModel.manager, branch: viewModel.branch, managerState: viewModel.getManagerState())
                          ],
                        ),
                      ),
                      SizedBox(height: 12.5),
                      HomeIconsModule(assets: viewModel.assets, user: viewModel.user.value, onTapQR: () => viewModel.onTapQR(),),
                      WeeklyCalendarModule(useCase: viewModel.calendarUseCase, matchLessons: viewModel.calendarUseCase.dayLessons,),
                    ],
                  ),
                ),
              ) : Container()),
            ),
          );
        });
  }


}







