import 'dart:math';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:get/get.dart';
import 'package:rainbow1872/viewModel/home_view_model.dart';

import '../../utils/my_drawer.dart';
import 'modules/banner_module.dart';
import 'modules/calendar_module.dart';
import 'modules/home_icons_module.dart';
import 'modules/location_state_module.dart';
import 'modules/user_info_module.dart';

class HomePage extends StatelessWidget {
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
              drawer: MyDrawer(name: "최준호",),
              appBar: AppBar(
                title: Text("홈"),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    LocationStateModule(),
                    BannerModule(),
                    UserInfoModule(),
                    CalendarModule(),
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






