import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:rainbow1872/src/data/models/banner.dart';
import 'package:rainbow1872/src/data/models/branch.dart';
import 'package:rainbow1872/src/data/models/lesson.dart';
import 'package:rainbow1872/src/data/models/manager.dart';
import 'package:rainbow1872/src/data/models/user.dart';
import 'package:rainbow1872/src/data/repositoris/banner_repository.dart';
import 'package:rainbow1872/src/data/repositoris/branch_repository.dart';
import 'package:rainbow1872/src/data/repositoris/lesson_repository.dart';
import 'package:rainbow1872/src/data/repositoris/manager_repository.dart';
import 'package:rainbow1872/src/domain/use_case/calendar_use_case.dart';

class HomeViewModel extends GetxController {
  final _branchRepository = BranchRepository();
  final _bannerRepository = BannerRepository();
  final _managerRepository = ManagerRepository();
  final _lessonRepository = LessonRepository();

  final calendarUseCase = CalendarUseCase();

  final _userBox = GetStorage(User.boxName);

  late User user;
  late Branch branch;
  late List<Banner> banners;
  late List<Lesson> lessons;
  late Manager manager;
  List<Lesson> missingLessons = [];
  RxList<Lesson> matchLessons = <Lesson>[].obs;

  var isLoaded = false.obs;
  var storeState = "";

  @override
  void onInit() async {
    user = await _userBox.read(User.boxName);
    branch = await _branchRepository.get(user.branch);
    banners = await _bannerRepository.getAll();
    manager = await _managerRepository.get(user.proUid);
    lessons = await _lessonRepository.getAll(user.uid);
    missingLessons.addAll(lessons.where((element) => !element.memberChecked));
    matchLessons.addAll(lessons.where((element) => DateTime.fromMillisecondsSinceEpoch(element.lessonDateTime).day == DateTime.now().day));
    calendarUseCase.selectDay.stream.listen((event) {
      matchLessons.clear();
      matchLessons.addAll(lessons.where((element) => DateTime.fromMillisecondsSinceEpoch(element.lessonDateTime).day == event.day));
    });
    await getStoreCondition();
    initializeDateFormatting();
    isLoaded.value = true;
    super.onInit();
  }

  Future getStoreCondition() async {
    switch(branch.status) {
      case "low" :
        return storeState = "쾌적";
      case "high" :
        return storeState = "복잡";
      default :
        return storeState = "보통";
   }
  }

  void addSample() {
    _lessonRepository.add();
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