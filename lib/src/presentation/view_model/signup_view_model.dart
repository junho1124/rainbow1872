import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rainbow1872/src/data/models/user.dart';
import 'package:rainbow1872/src/data/repositoris/login_repository.dart';
import 'package:rainbow1872/src/data/repositoris/user_repository.dart';
import 'package:rainbow1872/src/presentation/views/home_page/home_page.dart';

class SignupViewModel extends GetxController {

  final _userRepository = UserRepository();
  final _lonInRepository = LoginRepository();

  final _userBox = GetStorage(User.boxName);

  List<FocusNode> nodes = List.generate(5, (index) => FocusNode());
  List<TextEditingController> controllers =
      List.generate(5, (index) => TextEditingController());
  var currentFocus = 0.obs;

  void nextFocus() {
    nodes[currentFocus.value + 1].requestFocus();
    currentFocus.value++;
  }

  void onFocus(int index) {
    currentFocus.value = index;
  }

  Future signup() async {
    //빈 값이 없는지 확인
    if (controllers
        .every((element) => element.text.isNotEmpty || element.text != "")) {
      //비밀번호가 일치 하는지 확인
      if (controllers[3].text != controllers[4].text) {
        return Get.defaultDialog(
            title: "비밀번호 오류",
            middleText: "비밀번호 확인 값과 비밀 번호가 같지 않습니다.",
            onConfirm: () {
              Get.back();
            },
            textConfirm: "돌아가기",
            buttonColor: Colors.transparent,
          confirmTextColor: Colors.red,
        );
        //이메일 값이 정확한지 확인
      } else if (!controllers[0].text.isEmail) {
        return Get.defaultDialog(
            title: "이메일 오류",
            middleText: "이메일 형식이 잘못 되었습니다.",
            onConfirm: () {
              Get.back();
            },
            textConfirm: "돌아가기",
            buttonColor: Colors.transparent,
          confirmTextColor: Colors.red,
        );
        //모두 아니라면 로그인 단계 진입
      } else {
        await _userRepository.get(controllers[2].text).then((user) async {
          //등록된 유저가 맞는지 확인
          if (user != null) {
            User _user = user.copyWith(
                email: controllers[0].text,
                name: controllers[1].text,
                phone: controllers[2].text);
            await _lonInRepository.signIn(email: controllers[0].text, password: controllers[3].text, isLogin: false)
                .then((value) async {
                  if(value) {
                    //회원 가입 이 성공이라면 DB에 유저를 업데이트 하고 로컬 DB에 등록 후 홈페이지로

                    _user = _user.copyWith(
                      uid: await _userBox.read(User.uidBoxName)
                    );
                    await _userRepository.update(_user);
                    _userBox.write(User.boxName, _user);
                    _userBox.save();
                    Get.offNamed(HomePage.PATH);
                  }
            });
          } else {
            return Get.defaultDialog(
                title: "회원 가입 오류",
                middleText: "등록된 정보가 없습니다.\n관리자에게 문의 해 주세요.",
                onConfirm: () {
                  Get.back();
                },
                textConfirm: "돌아가기",
                buttonColor: Colors.transparent,
                confirmTextColor: Colors.red,
            );
          }
        });
      }
    } else {
      return Get.defaultDialog(
        title: "입력 오류",
        middleText: "회원 가입 정보 중 빈 값이 있습니다.\n회원가입 정보를 다시한번 확인 해 주세요.",
        onConfirm: () {
          Get.back();
        },
        textConfirm: "돌아가기",
        buttonColor: Colors.transparent,
        confirmTextColor: Colors.red,
      );
    }
  }
}
