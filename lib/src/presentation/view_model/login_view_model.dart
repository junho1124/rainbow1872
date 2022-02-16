import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rainbow1872/src/data/models/user.dart';
import 'package:rainbow1872/src/data/repositoris/login_repository.dart';
import 'package:rainbow1872/src/data/repositoris/user_repository.dart';
import 'package:rainbow1872/src/presentation/views/home_page/home_page.dart';

class LoginViewModel extends GetxController {
  final _lonInRepository = LoginRepository();
  final _userRepository = UserRepository();


  final _userBox = GetStorage(User.boxName);

  List<FocusNode> nodes = List.generate(2, (index) => FocusNode());
  List<TextEditingController> controllers = List.generate(2, (index) => TextEditingController());
  var currentFocus = 0.obs;

  void nextFocus() {
    nodes[currentFocus.value + 1].requestFocus();
    currentFocus.value++;
  }

  void onFocus(int index) {
    currentFocus.value = index;
  }

  Future signIn() async {
    await _lonInRepository.signIn(email: controllers[0].text, password: controllers[1].text, isLogin: true).then((value) async {
      if(value) {
        await _userRepository.getFromEmail(controllers[0].text).then((user) {
          if(user != null) {
            _userBox.write(User.boxName, user);
            _userBox.save();
            Get.offNamed(HomePage.PATH);
          }
        });
      }
    });
  }
}