import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow1872/src/config/routes/app_routes.dart';
import 'package:rainbow1872/src/config/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      theme: AppTheme.light,
    );
  }
}

AppBar defaultAppBar({required String title}) {
  return AppBar(
    title: Text(title),
    centerTitle: false,
  );
}

