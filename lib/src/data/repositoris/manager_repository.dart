import 'package:rainbow1872/src/data/models/manager.dart';
import 'package:rainbow1872/src/domain/repositoris/fire_repository.dart';

class ManagerRepository extends FireRepository<Manager> {

  @override
  Future<Manager> get(String key) async {
    return await super.db.collection("manager").where("uid", isEqualTo: key).get().then((value) {
      return Manager.fromJson(value.docs.first.data());
    });
  }
}