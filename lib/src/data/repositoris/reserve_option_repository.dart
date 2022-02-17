import 'package:rainbow1872/src/data/models/reserve_option.dart';
import 'package:rainbow1872/src/domain/repositoris/fire_repository.dart';

class ReserveOptionRepository extends FireRepository<ReserveOption> {

  @override
  Future<ReserveOption> get(String key) async {
    return await super.db.collection("reserveOption").doc(key).get().then((value) => ReserveOption.fromJson(value.data()!));
  }
}