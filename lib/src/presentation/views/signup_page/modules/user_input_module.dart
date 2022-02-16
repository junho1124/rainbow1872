import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:rainbow1872/src/presentation/view_model/signup_view_model.dart';

class UserInputModule extends StatelessWidget {
  const UserInputModule({
    required this.viewModel,
    Key? key,
  }) : super(key: key);

  final SignupViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.65,
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("E-mail(로그인 아이디)", style: TextStyle(fontWeight: FontWeight.w500)),
          SizedBox(
              height: 25,
              width: context.width,
              child: TextField(
                onTap: () => viewModel.onFocus(0),
                controller: viewModel.controllers[0],
                focusNode: viewModel.nodes[0],
                keyboardType: TextInputType.emailAddress,
                autofocus: true,
                onSubmitted: (_) => viewModel.nextFocus(),
              )
          ),
          const Text("이름 입력", style: TextStyle(fontWeight: FontWeight.w500)),
          SizedBox(
              height: 30,
              width: context.width,
              child: TextField(
                onTap: () => viewModel.onFocus(1),
                controller: viewModel.controllers[1],
                focusNode: viewModel.nodes[1],
                onSubmitted: (_) => viewModel.nextFocus(),
              )
          ),
          const Text("휴대전화 번호", style: TextStyle(fontWeight: FontWeight.w500)),
          SizedBox(
              height: 30,
              width: context.width,
              child: TextField(
                onTap: () => viewModel.onFocus(2),
                controller: viewModel.controllers[2],
                keyboardType: TextInputType.number,
                inputFormatters: [
                  MaskedInputFormatter("###-####-####")
                ],
                focusNode: viewModel.nodes[2],
                onSubmitted: (_) => viewModel.nextFocus(),
              )
          ),
          const Text("비밀번호", style: TextStyle(fontWeight: FontWeight.w500)),
          SizedBox(
              height: 30,
              width: context.width,
              child: TextField(
                onTap: () => viewModel.onFocus(3),
                controller: viewModel.controllers[3],
                obscureText: true,
                focusNode: viewModel.nodes[3],
                onSubmitted: (_) => viewModel.nextFocus(),
              )
          ),
          const Text("비밀번호 확인", style: TextStyle(fontWeight: FontWeight.w500)),
          SizedBox(
              height: 30,
              width: context.width,
              child: TextField(
                onTap: () => viewModel.onFocus(4),
                controller: viewModel.controllers[4],
                obscureText: true,
                focusNode: viewModel.nodes[4],
              )
          ),
          const SizedBox(height: 30),
          InkWell(
            onTap: () => viewModel.signup(),
            child: Container(
              height: 50,
              width: context.width,
              decoration: BoxDecoration(
                  color: Color(0xFF00D976),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: const Center(child: Text("회원 가입", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),)),
            ),
          ),
        ],
      ),
    );
  }
}
