import 'package:rainbow1872/src/data/models/lesson.dart';
import 'package:rainbow1872/src/domain/repositoris/fire_repository.dart';

class LessonRepository extends FireRepository<Lesson> {

  Future<List<Lesson>> getAll(String key) async {
    return await super.db.collection("lesson").where("uid", isEqualTo: key).get().then((value) {
      final List<Lesson> result = [];
      for(var item in value.docs) {
        result.add(Lesson.fromJson(item.data()));
      }
      return result;
    });
  }
  
  Future add() async {
    final sampleLesson = Lesson(checkedTime: 0, coachUid: "3t6GnKo1fjeMMOztrk4gjwAd40G2", lessonDateTime: DateTime.now().millisecondsSinceEpoch, lessonMemo: "", lessonNote: "", lessontime: Duration(minutes: 15).inMilliseconds, memberChecked: false, type: "레슨", uid: "HYDWTRWiUqWynWb9Iu5WkNpDxaH2");
    await super.db.collection("lesson").doc("최준호_${DateTime.now().millisecondsSinceEpoch}").set(sampleLesson.toJson());
  } 
}