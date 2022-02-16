import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow1872/src/presentation/view_model/login_view_model.dart';

import 'modules/login_bottom_banner_module.dart';
import 'modules/login_input_module.dart';

class LoginPage extends StatelessWidget {
  static const String PATH = "/LoginPage";

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginViewModel>(
      init: LoginViewModel(),
      builder: (viewModel) {
        return GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if(!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Scaffold(
            appBar: AppBar(
              title: const Text("회원 로그인"),
            ),
            resizeToAvoidBottomInset: false,
            body: Column(
              children: [
                LoginInputModule(viewModel: viewModel),
                LoginBottomBannerModule()
              ],
            ),
          ),
        );
      }
    );
  }
}


