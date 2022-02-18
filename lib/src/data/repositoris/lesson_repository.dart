import 'package:cloud_firestore/cloud_firestore.dart';
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

  @override
  Future update(Lesson item) async {
    await super.db.collection("lesson").where("lessonDateTime", isEqualTo: item.lessonDateTime).get().then((value) async {
      Lesson lesson = Lesson.fromJson(value.docs.first.data());
      lesson = lesson.copyWith(checkedTime: DateTime.now().millisecondsSinceEpoch, memberChecked: true);
      await super.db.collection("lesson").doc(value.docs.first.id).set(lesson.toJson());
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getStream(String uid) {
    return db.collection("lesson").where("uid", isEqualTo: uid).snapshots();
  }
}