import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow1872/main.dart';
import 'package:rainbow1872/src/presentation/view_model/store_state_view_model.dart';
import 'package:rainbow1872/src/presentation/widgets/my_drawer.dart';

class StoreStatePage extends StatelessWidget {
  static const String PATH = "/StoreStatePage";
  const StoreStatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreStateViewModel>(
      init: StoreStateViewModel(),
      builder: (viewModel) {
        return Scaffold(
          drawer: MyDrawer(),
          appBar: defaultAppBar(title: "예약"),
          body: Obx(() => viewModel.isLoaded.isTrue ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50,
                width: context.width,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xA4A871FD), Colors.lightBlueAccent],
                        stops: [0.2, 0.6])
                ),
                child: Center(
                    child: Text(
                      viewModel.branch.branch,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    )),
              ),
              Image.asset(getBranchStateImage(viewModel.branch.status), height: context.width, width: context.width,),
              InkWell(
                onTap: () => viewModel.callToBranch(),
                child: Container(
                  width: context.width - 30,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color(0xFF1BF19C),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(0.5, 0.5), blurRadius: 0.5)]
                  ),
                  child: Center(child: Text("매장 문의 하기", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),)),
                ),
              ),
              const SizedBox(height: 50)
            ],
          ) : Container()),
        );
      }
    );
  }

  String getBranchStateImage(String status) {
    switch(status) {
      case "low" :
        return "assets/congestion_good.png";
      case "middle" :
        return "assets/congestion_confuse.png";
      case "high" :
        return "assets/congestion_bad.png";
      default :
        return "assets/congestion_good.png";
    }
  }
}
