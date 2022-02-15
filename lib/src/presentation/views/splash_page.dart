import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow1872/src/presentation/view_model/splash_view_model.dart';

class SplashPage extends StatelessWidget {
  static const String PATH = "/";
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashViewModel>(
      init: SplashViewModel(),
      builder: (viewModel) {
        return Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/rainbow_splash.png"), fit: BoxFit.cover),
            color: Color.fromRGBO(36, 52, 85, 1)
          ),
        );
      }
    );
  }
}