import 'package:rainbow1872/src/data/models/manager_schedule.dart';
import 'package:rainbow1872/src/domain/repositoris/fire_repository.dart';

class ManagerScheduleRepository extends FireRepository<ManagerSchedule> {

  @override
  Future<Map<int ,ManagerSchedule>> get(String key) async {
    return await super.db.collection("manager_schedule").doc(key).get().then((value) {
      Map<int, ManagerSchedule> result = {};
      for(var item in value.data()!["schedule"]) {
        final schedule = ManagerSchedule.fromJson(item);
        switch(schedule.dayOfWeek) {
          case "mon" :
            result[DateTime.monday] = schedule;
            break;
          case "tue" :
            result[DateTime.tuesday] = schedule;
            break;
          case "wen" :
            result[DateTime.wednesday] = schedule;
            break;
          case "thu" :
            result[DateTime.thursday] = schedule;
            break;
          case "fri" :
            result[DateTime.friday] = schedule;
            break;
          case "sat" :
            result[DateTime.saturday] = schedule;
            break;
          case "sun" :
            result[DateTime.sunday] = schedule;
            break;
        }
      }
      return result;
    });
  }
}