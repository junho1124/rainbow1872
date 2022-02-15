import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupViewModel extends GetxController {
  List<FocusNode> nodes = List.generate(5, (index) => FocusNode());

  var currentFocus = 0.obs;

  void nextFocus() {
    nodes[currentFocus.value + 1].requestFocus();
    currentFocus.value ++;
  }

  void onFocus(int index) {
    currentFocus.value = index;
  }
}