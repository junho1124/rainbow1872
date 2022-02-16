import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:rainbow1872/src/data/models/user.dart';

class HomeViewModel extends GetxController {
  final _userBox = GetStorage(User.boxName);

  late User user;
  @override
  void onInit() async {
    user = await _userBox.read(User.boxName);
    initializeDateFormatting();
    super.onInit();
  }

  List<String> assets = [
    "assets/icon_review.png",
    "assets/icon_swing.png",
    "assets/icon_store.png",
    "assets/icon_profile.png"
  ];

  List<String> titles = [
    "레슨 리뷰",
    "스윙 분석",
    "매장 정보",
    "내 정보"
  ];
}