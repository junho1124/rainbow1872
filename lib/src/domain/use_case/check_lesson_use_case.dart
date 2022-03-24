import 'package:get_storage/get_storage.dart';
import 'package:rainbow1872/src/data/models/lesson.dart';
import 'package:rainbow1872/src/data/models/user.dart';
import 'package:rainbow1872/src/data/repositoris/lesson_repository.dart';
import 'package:rainbow1872/src/data/repositoris/user_repository.dart';

class CheckLessonUseCase {
  final _userRepository = UserRepository();
  final _lessonRepository = LessonRepository();

  final _userBox = GetStorage(User.boxName);

  Future call(Lesson lesson) async {
    User user = _userBox.read(User.boxName);
    await _lessonRepository.update(lesson);
    await _userRepository.membershipCountChange(user.uid, Duration(milliseconds: lesson.lessontime).inMinutes ~/ 15);
  }
}