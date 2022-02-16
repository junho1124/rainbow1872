import 'package:flutter/material.dart';
import 'package:rainbow1872/main.dart';
import 'package:rainbow1872/src/presentation/widgets/my_drawer.dart';

class AccountPage extends StatelessWidget {
  static const String PATH = "/AccountPage";
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: defaultAppBar(title: "내 회원권 정보"),
      body: Column(
        children: [
          SizedBox(height: 18,),
          Center(
            child: Stack(
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/default_profile.png"),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Icon(Icons.camera_alt, size: 30,),
                )
              ],
            ),
          ),
          Text("최준호 회원님", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),),
          Divider(color: Colors.black),
          // UserInfoModule(),
          Divider(color: Colors.black),
          Container(
            width: double.infinity,
            height: 150,
            margin: EdgeInsets.symmetric(horizontal: 8),
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/banner_ticket.png"), fit: BoxFit.fitWidth),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("ASDDGF", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),),
                Text("시간: 15분 / 30회 레슨권 / 3개월", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
