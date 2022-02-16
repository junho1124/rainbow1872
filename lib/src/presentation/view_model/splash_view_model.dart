import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rainbow1872/src/data/models/user.dart' as myUser;
import 'package:rainbow1872/src/data/repositoris/user_repository.dart';
import 'package:rainbow1872/src/presentation/views/home_page/home_page.dart';
import 'package:rainbow1872/src/presentation/views/signup_page/signup_page.dart';

class SplashViewModel extends GetxController {
  final _auth = FirebaseAuth.instance;
  final _userBox = GetStorage(myUser.User.boxName);
  final _userRepository = UserRepository();
  @override
  void onInit() async {
    _userBox.initStorage;
    await Future.delayed(Duration(seconds: 1)).then((value) async => _auth.currentUser != null ? await _userRepository.getFromUid(_auth.currentUser!.uid).then((value) => Get.offNamed(HomePage.PATH))  : Get.offNamed(SignupPage.PATH));
    super.onInit();
  }
}