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
  
  Future add(Lesson lesson, String managerName) async {
    await super.db.collection("lesson").doc("${managerName}_${DateTime.now().millisecondsSinceEpoch}").set(lesson.toJson());
  } 
}