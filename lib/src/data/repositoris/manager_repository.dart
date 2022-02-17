import 'package:get_storage/get_storage.dart';
import 'package:rainbow1872/src/data/models/manager.dart';
import 'package:rainbow1872/src/domain/repositoris/fire_repository.dart';

class ManagerRepository extends FireRepository<Manager> {
  final _managerBox = GetStorage(Manager.boxName);

  @override
  Future<Manager> get(String key) async {
    return await super.db.collection("manager").where("uid", isEqualTo: key).get().then((value) {
      final result = Manager.fromJson(value.docs.first.data());
      _managerBox.write(Manager.boxName, result);
      _managerBox.save();
      return result;
    });
  }
}