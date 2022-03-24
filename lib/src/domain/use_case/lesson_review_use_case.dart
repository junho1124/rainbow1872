import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rainbow1872/src/core/utils/log.dart';
import 'package:rainbow1872/src/data/models/lesson.dart';
import 'package:rainbow1872/src/data/models/manager.dart';
import 'package:rainbow1872/src/data/models/user.dart';
import 'package:rainbow1872/src/data/repositoris/lesson_repository.dart';
import 'package:rainbow1872/src/data/repositoris/user_repository.dart';
import 'package:rainbow1872/src/domain/use_case/check_lesson_use_case.dart';

class LessonReviewUseCase extends GetxController {
  LessonReviewUseCase({required this.isMissing});
  final RxBool isMissing;

  final _lessonRepository = LessonRepository();
  final _userRepository = UserRepository();
  final _checkLessonUseCase = CheckLessonUseCase();

  final _userBox = GetStorage(User.boxName);
  final _managerBox = GetStorage(Manager.boxName);

  Rx<User>? user;
  Manager? manager;
  RxBool isLoaded = false.obs;

  RxList<Lesson> lessons = <Lesson>[].obs;

  @override
  Future onInit() async {
    isLoaded = false.obs;
    final User _user = _userBox.read(User.boxName);
    user = _user.obs;
    manager = _managerBox.read(Manager.boxName);
    lessons.clear();
    if(isMissing.isFalse) {
      lessons.addAll((await _lessonRepository.getAll(user!.value.uid)));
    } else {
      lessons.addAll((await _lessonRepository.getAll(user!.value.uid)).where((element) => element.checkedTime == 0).toList());
      Log.d((await _lessonRepository.getAll(user!.value.uid)).where((element) => element.checkedTime == 0).toList());
    }
    isLoaded.value = true;
    Log.d(lessons);
    super.onInit();
  }

  Future checkLesson(Lesson lesson) async {
    await _checkLessonUseCase.call(lesson).then((value) async {
      await _userRepository.getByUid(user!.value.uid).then((value) => value != null ? user!.value = value : null);
      lessons.clear();
      if(isMissing.isFalse) {
        lessons.addAll((await _lessonRepository.getAll(user!.value.uid)));
      } else {
        lessons.addAll((await _lessonRepository.getAll(user!.value.uid)).where((element) => element.checkedTime == 0).toList());
      }
      lessons.sort((b, a) => a.lessonDateTime.compareTo(b.lessonDateTime));
    });
  }

}