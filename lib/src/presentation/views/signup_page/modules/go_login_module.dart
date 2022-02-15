import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow1872/src/presentation/views/login_page/login_page.dart';

class GoLoginModule extends StatelessWidget {
  const GoLoginModule({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: context.width,
        color: Color(0xFF0036DC),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("이미 회원가입을 하셨나요?", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w200)),
            InkWell(
              onTap: () {
                Get.toNamed(LoginPage.PATH);
              },
              child: Container(
                height: 30,
                width: context.width * 0.4,
                padding: EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Center(child: Text("로그인 바로가기", style: TextStyle(color: Color(0xFF0036DC), fontSize: 16, fontWeight: FontWeight.w700))),
              ),
            )

          ],
        ),
      ),
    );
  }
}
