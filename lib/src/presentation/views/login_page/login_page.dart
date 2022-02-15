import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow1872/src/presentation/views/home_page/home_page.dart';

class LoginPage extends StatelessWidget {
  static const String PATH = "/LoginPage";

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("회원 로그인"),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            height: context.height * 0.65,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: context.height * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset("assets/banner_logo.png"),
                      const Text("E-mail(로그인 아이디)",
                          style: TextStyle(fontWeight: FontWeight.w500)),
                      SizedBox(
                          height: 25, width: context.width, child: TextField(
                        keyboardType: TextInputType.emailAddress,
                      )),
                      const Text("비밀번호",
                          style: TextStyle(fontWeight: FontWeight.w500)),
                      SizedBox(
                          height: 25, width: context.width, child: TextField(
                        obscureText: true,
                      )),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.offNamed(HomePage.PATH);
                  },
                  child: Container(
                    height: 50,
                    width: context.width,
                    decoration: BoxDecoration(
                        color: const Color(0xFF00D976),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                        child: Text(
                      "로그인",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                    )),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: const Color(0xFF0036DC),
              width: context.width,
              padding: const EdgeInsets.all(16),
              child: const Align(
                  alignment: Alignment.topCenter,
                  child: Text("레인보우 1872 접속을 환영합니다.",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400))),
            ),
          )
        ],
      ),
    );
  }
}
