import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

class HomeViewModel extends GetxController {
  @override
  void onInit() {
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