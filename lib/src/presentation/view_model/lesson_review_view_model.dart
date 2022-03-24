import 'package:get/get.dart';
import 'package:rainbow1872/src/data/models/lesson.dart';
import 'package:rainbow1872/src/data/repositoris/lesson_repository.dart';
import 'package:rainbow1872/src/domain/use_case/lesson_review_use_case.dart';

class LessonReviewViewModel extends GetxController {
  final useCase = Get.put(LessonReviewUseCase(isMissing: false.obs));
  final _lessonRepository = LessonRepository();


  @override
  void onInit() async {
    _lessonRepository.getStream(useCase.user!.value.uid).listen((event) {
      event.docChanges.forEach((element) {
        final update = Lesson.fromJson(element.doc.data()!);
        useCase.lessons.removeWhere((element) => element.lessonDateTime == update.lessonDateTime);
        useCase.lessons.add(update);
      });
      useCase.lessons.sort((b, a) => a.lessonDateTime.compareTo(b.lessonDateTime));
    });
    super.onInit();
  }

  @override
  void onClose() {
    useCase.onDelete;
    super.onClose();
  }
}