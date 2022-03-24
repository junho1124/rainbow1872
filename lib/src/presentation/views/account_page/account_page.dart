import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow1872/main.dart';
import 'package:rainbow1872/src/presentation/view_model/account_view_model.dart';
import 'package:rainbow1872/src/presentation/widgets/my_drawer.dart';
import 'package:rainbow1872/src/presentation/widgets/user_info_module.dart';

class AccountPage extends StatelessWidget {
  static const String PATH = "/AccountPage";
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountViewModel>(
      init: AccountViewModel(),
      builder: (viewModel) {
        return Scaffold(
          drawer: MyDrawer(),
          appBar: defaultAppBar(title: "내 회원권 정보"),
          body: Obx(() => viewModel.isLoaded.isTrue ? Column(
            children: [
              SizedBox(height: 18),
              Center(
                child: Stack(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(viewModel.user.profileImg ?? ""),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: InkWell(
                        onTap: () {
                          viewModel.getProfileImage();
                        },
                        child: Icon(Icons.camera_alt, size: 30,),
                      ),
                    )
                  ],
                ),
              ),
              Text("${viewModel.user.name} 회원님", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),),
              Divider(color: Colors.black),
              UserInfoModule(user: viewModel.user, manager: viewModel.manager, branch: viewModel.branch,),
              Divider(color: Colors.black),
              Container(
                width: double.infinity,
                height: 170,
                margin: EdgeInsets.symmetric(horizontal: 8),
                padding: EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/banner_ticket.png"), fit: BoxFit.fitWidth),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(viewModel.user.lessonMembershipType, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),),
                    Text(switchMembershipType(viewModel.user.lessonMembershipType), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  ],
                ),
              )
            ],
          ) : Container()),
        );
      }
    );
  }

  String switchMembershipType(String membershipType) {
    switch(membershipType) {
      case "v10m1" :
        return "시간: 15분 / 10회 레슽권 / 1개월";
      case "v20m3" :
        return "시간: 15분 / 20회 레슽권 / 3개월";
      case "v30m3" :
        return "시간: 15분 / 30회 레슽권 / 3개월";
      case "v30m6" :
        return "시간: 15분 / 30회 레슽권 / 6개월";
      case "v50m6" :
        return "시간: 15분 / 50회 레슽권 / 6개월";
      case "v60m12" :
        return "시간: 15분 / 60회 레슽권 / 12개월";
      default:
        return "시간: 15분 / 10회 레슽권 / 1개월";
    }
  }
}
