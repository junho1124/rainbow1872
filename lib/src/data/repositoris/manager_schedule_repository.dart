import 'package:rainbow1872/src/data/models/manager_schedule.dart';
import 'package:rainbow1872/src/domain/repositoris/fire_repository.dart';

class ManagerScheduleRepository extends FireRepository<ManagerSchedule> {

  @override
  Future<List<ManagerSchedule>> get(String key) async {
    return await super.db.collection("manager_schedule").doc(key).get().then((value) {
      List<ManagerSchedule> result = [];
      for(var item in value.data()!["schedule"]) {
        result.add(ManagerSchedule.fromJson(item));
      }
      return result;
    });
  }
}