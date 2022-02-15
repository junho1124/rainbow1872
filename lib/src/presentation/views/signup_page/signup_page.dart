import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow1872/src/presentation/view_model/signup_view_model.dart';

import 'modules/go_login_module.dart';
import 'modules/user_input_module.dart';

class SignupPage extends StatelessWidget {
  static const String PATH = "/SignupPage";

  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupViewModel>(
        init: SignupViewModel(),
        builder: (viewModel) {
          return Scaffold(
            appBar: AppBar(
              title: Text("회원 가입 하기"),
            ),
            resizeToAvoidBottomInset: false,
            body: SizedBox(
              height: context.height,
              child: Column(
                children: [
                  UserInputModule(viewModel: viewModel),
                  GoLoginModule()
                ],
              ),
            ),
          );
        },
    );
  }
}
