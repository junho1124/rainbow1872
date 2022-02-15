import 'package:get/get.dart';
import 'package:rainbow1872/src/presentation/views/home_page/home_page.dart';

class SplashViewModel extends GetxController {
  @override
  void onInit() async {
    await Future.delayed(Duration(seconds: 1)).then((value) => Get.offNamed(HomePage.PATH));
    super.onInit();
  }
}