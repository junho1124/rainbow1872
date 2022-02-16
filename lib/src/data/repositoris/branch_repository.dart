import 'package:rainbow1872/src/data/models/branch.dart';
import 'package:rainbow1872/src/domain/repositoris/fire_repository.dart';

class BranchRepository extends FireRepository<Branch> {

  @override
  Future<Branch> get(String key) async {
    return await super.db.collection("branch").doc(key).get().then((value) => Branch.fromJson(value.data()!));
  }
}