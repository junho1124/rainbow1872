import 'package:rainbow1872/src/core/utils/log.dart';
import 'package:rainbow1872/src/data/models/branch.dart';
import 'package:rainbow1872/src/domain/repositoris/fire_repository.dart';

class BranchRepository extends FireRepository<Branch> {

  @override
  Future<Branch> get(String key) async {
    return await db.collection("branch").doc(key).get().then((value) {
      Log.d(key);
      Log.d(value.data());
      return Branch.fromJson(value.data()!);
    });
  }
}