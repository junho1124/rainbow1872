import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rainbow1872/src/core/utils/log.dart';
import 'package:rainbow1872/src/data/models/user.dart' as my;

class LoginRepository {
  final _auth = FirebaseAuth.instance;
  final _uidBox = GetStorage(my.User.boxName);

  Future<bool> signIn(
      {required String email,
      required String password,
      required bool isLogin}) async {
    bool isSuccess = false;
    try {
      //회원 정보가 있는지 먼저 확인 후 유져가 있으면 로그인 처리
      return await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
            _uidBox.write(my.User.uidBoxName, value.user!.uid);
            _uidBox.save();
        isSuccess = true;
        return isSuccess;
      });
    } on FirebaseAuthException catch (e) {
      Log.d(e.code);
      //이메일은 있으나 비밀번호가 잘못 된 경우
      if (e.code == "wrong-password") {
        return isLogin
            //로그인 이라면 비밀번호 오류 return false
            ? await Get.defaultDialog(
                title: "비밀번호 오류",
                middleText: "잘못된 비밀 번호 입니다.",
                onConfirm: () {
                  Get.back();
                },
                textConfirm: "돌아가기",
                buttonColor: Colors.transparent,
                confirmTextColor: Colors.red,
              ).then((value) => isSuccess)
            //회원 가입이라면 이미 등록된 계정에 비밀번호만 바꿔 다시 계정 생성 후 로그인
            : await Get.defaultDialog(
                    title: "이미 등록된 계정",
                    middleText: "이미 등록된 정보 있습니다.\n새로운 계정으로 로그인 하시겠습니까?",
                    onConfirm: () async {
                      await _signup(email: email, password: password).then((value) {
                        _uidBox.write(my.User.uidBoxName, value!.user!.uid);
                        _uidBox.save();
                        isSuccess = true;
                      });
                    },
                    textConfirm: "로그인",
                    onCancel: () => Get.back,
                    textCancel: "돌아가기",
                    buttonColor: Colors.transparent,
                    confirmTextColor: Color(0xFF00D976),
                    cancelTextColor: Colors.red)
                .then((value) => isSuccess);
      //계정 자체가 존재 하지 않는 경우
      } else if (e.code == "user-not-found") {
        return isLogin
            //로그인 중이라면 계정 정보 오류 return false
            ? await Get.defaultDialog(
                title: "로그인 오류",
                middleText: "계정 정보가 존재하지 않습니다.",
                onConfirm: () {
                  Get.back();
                },
                textConfirm: "돌아가기",
                buttonColor: Colors.transparent,
                confirmTextColor: Colors.red,
              ).then((value) => isSuccess)
            //회원 가입이라면 계정이 존재하지 않으므로 새로 생성
            : await Get.defaultDialog(
                    title: "회원 가입",
                    middleText: "등록된 정보로 회원 가입 하시겠습니까?",
                    onConfirm: () async {
                      await _signup(email: email, password: password).then((value) {
                        _uidBox.write(my.User.uidBoxName, value!.user!.uid);
                        _uidBox.save();
                        isSuccess = true;
                      });
                    },
                    textConfirm: "회원가입",
                    onCancel: () => Get.back,
                    textCancel: "돌아가기",
                    buttonColor: Colors.transparent,
                    confirmTextColor: Color(0xFF00D976),
                    cancelTextColor: Colors.red)
                .then((value) => isSuccess);
      } else {
        Log.d(e.code);
        return isSuccess;
      }
    } catch (e) {
      Log.d(e);
      return isSuccess;
    }
  }

  Future<UserCredential?> _signup(
      {required String email, required String password}) async {
    return await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }
}
