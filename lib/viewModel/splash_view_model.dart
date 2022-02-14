import 'package:get/get.dart';
import 'package:rainbow1872/view/home_page/home_page.dart';

class SplashViewModel extends GetxController {
  @override
  void onInit() async {
    await Future.delayed(Duration(seconds: 1)).then((value) => Get.off(HomePage()));
    super.onInit();
  }
}