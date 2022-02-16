import 'package:rainbow1872/src/data/models/user.dart';
import 'package:rainbow1872/src/domain/repositoris/fire_repository.dart';

class UserRepository extends FireRepository<User> {

  @override
  Future<User?> get(String key) async {
    return await super.db.collection("user").where("phone", isEqualTo: key).get().then((value) {
      if(value.docs.first.exists) {
        return User.fromJson(value.docs.first.data());
      } else {
        return null;
      }
    });
  }

  @override
  Future update(User item) async {
    await super.db.collection("user").where("phone", isEqualTo: item.phone).get().then((value) async {
      await super.db.collection("user").doc(value.docs.first.id).update(item.toJson());
    });
  }

  Future<User?> getFromEmail(String key) async {
    return await super.db.collection("user").where("email", isEqualTo: key).get().then((value) {
      if(value.docs.first.exists) {
        return User.fromJson(value.docs.first.data());
      } else {
        return null;
      }
    });
  }
}