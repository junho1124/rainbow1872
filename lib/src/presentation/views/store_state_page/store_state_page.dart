import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:rainbow1872/main.dart';
import 'package:rainbow1872/src/presentation/widgets/my_drawer.dart';

class StoreStatePage extends StatelessWidget {
  static const String PATH = "/StoreStatePage";
  const StoreStatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(name: "최준호"),
      appBar: defaultAppBar(title: "예약"),
      body: Column(
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
            child: const Center(
                child: Text(
                  "여의도점",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                )),
          ),
          Image.asset("assets/congestion_good.png", height: context.width, width: context.width,),
          Container(
            width: context.width - 30,
            height: 50,
            decoration: BoxDecoration(
              color: Color(0xFF1BF19C),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(0.5, 0.5), blurRadius: 0.5)]
            ),
            child: Center(child: Text("매장 문의 하기", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),)),
          ),
          const SizedBox(height: 50)
        ],
      ),
    );
  }
}
