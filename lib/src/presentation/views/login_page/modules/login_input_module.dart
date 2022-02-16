import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow1872/src/presentation/view_model/login_view_model.dart';

class LoginInputModule extends StatelessWidget {
  const LoginInputModule({
    required this.viewModel,
    Key? key,
  }) : super(key: key);

  final LoginViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  controller: viewModel.controllers[0],
                  focusNode: viewModel.nodes[0],
                  onTap: () => viewModel.onFocus(0),
                  onSubmitted: (_) => viewModel.nextFocus(),
                )),
                const Text("비밀번호",
                    style: TextStyle(fontWeight: FontWeight.w500)),
                SizedBox(
                    height: 25, width: context.width, child: TextField(
                  obscureText: true,
                  controller: viewModel.controllers[1],
                  focusNode: viewModel.nodes[1],
                  onSubmitted: (_) => FocusScope.of(context).unfocus(),
                )),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              viewModel.signIn();
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
    );
  }
}
