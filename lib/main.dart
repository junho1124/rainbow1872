import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rainbow1872/src/config/routes/app_routes.dart';
import 'package:rainbow1872/src/config/themes/app_theme.dart';
import 'package:rainbow1872/src/core/utils/log.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  Log.init();
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
    title: Text(title, style: TextStyle(fontSize: 14),),
    centerTitle: false,
  );
}

