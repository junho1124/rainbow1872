import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rainbow1872/src/core/utils/log.dart';
import 'package:rainbow1872/src/data/models/lesson.dart';
import 'package:rainbow1872/src/data/models/manager.dart';
import 'package:rainbow1872/src/data/models/user.dart';
import 'package:rainbow1872/src/data/repositoris/lesson_repository.dart';
import 'package:rainbow1872/src/data/repositoris/user_repository.dart';

class LessonReviewUseCase extends GetxController {
  LessonReviewUseCase({required this.isMissing});
  final RxBool isMissing;

  final _lessonRepository = LessonRepository();
  final _userRepository = UserRepository();

  final _userBox = GetStorage(User.boxName);
  final _managerBox = GetStorage(Manager.boxName);

  User? user;
  Manager? manager;
  RxBool isLoaded = false.obs;

  RxList<Lesson> lessons = <Lesson>[].obs;

  @override
  Future onInit() async {
    isLoaded = false.obs;
    user = _userBox.read(User.boxName);
    manager = _managerBox.read(Manager.boxName);
    lessons.clear();
    if(isMissing.isFalse) {
      lessons.addAll((await _lessonRepository.getAll(user!.uid)));
    } else {
      lessons.addAll((await _lessonRepository.getAll(user!.uid)).where((element) => element.checkedTime == 0).toList());
      Log.d((await _lessonRepository.getAll(user!.uid)).where((element) => element.checkedTime == 0).toList());
    }
    isLoaded.value = true;
    Log.d(lessons);
    super.onInit();
  }

  Future checkLesson(Lesson lesson) async {
    await _lessonRepository.update(lesson).then((value) async {
      _userRepository.membershipCountChange(user!.uid);
      lessons.clear();
      if(isMissing.isFalse) {
        lessons.addAll((await _lessonRepository.getAll(user!.uid)));
      } else {
        lessons.addAll((await _lessonRepository.getAll(user!.uid)).where((element) => element.checkedTime == 0).toList());
      }
      lessons.sort((b, a) => a.lessonDateTime.compareTo(b.lessonDateTime));
    });
  }

}