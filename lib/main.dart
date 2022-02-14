import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow1872/view/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light().copyWith(
          appBarTheme: AppBarTheme(
            color: Color(0xD0F8F8F8),
            iconTheme: IconThemeData(color: Colors.black),
            foregroundColor: Colors.black,
            elevation: 0.5
          )),
      home: SplashPage(),
    );
  }
}

AppBar defaultAppBar({required String title}) {
  return AppBar(
    title: Text(title),
    centerTitle: false,
  );
}

