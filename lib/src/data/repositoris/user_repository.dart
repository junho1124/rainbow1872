import 'package:get_storage/get_storage.dart';
import 'package:rainbow1872/src/data/models/user.dart';
import 'package:rainbow1872/src/domain/repositoris/fire_repository.dart';

class UserRepository extends FireRepository<User> {

  final _userBox = GetStorage(User.boxName);

  @override
  Future<User?> get(String key) async {
    return await super.db.collection("user").where("phone", isEqualTo: key).get().then((value) {
        final user = User.fromJson(value.docs.first.data());
        _userBox.write(User.boxName, user);
        _userBox.save();
        return user;
    });
  }

  @override
  Future<User?> update(User item) async {
    return await super.db.collection("user").where("phone", isEqualTo: item.phone).get().then((value) async {
      await super.db.collection("user").doc(value.docs.first.id).update(item.toJson());
      final user = User.fromJson(value.docs.first.data());
      _userBox.write(User.boxName, user);
      _userBox.save();
      return user;
    });
  }

  Future<User?> getFromEmail(String key) async {
    return await super.db.collection("user").where("email", isEqualTo: key).get().then((value) {
      if(value.docs.first.exists) {
        final user = User.fromJson(value.docs.first.data());
        _userBox.write(User.boxName, user);
        _userBox.save();
        return user;
      } else {
        return null;
      }
    });
  }

  Future<User?> getFromUid(String key) async {
    return await super.db.collection("user").where("uid", isEqualTo: key).get().then((value) {
      if(value.docs.first.exists) {
        final user = User.fromJson(value.docs.first.data());
        _userBox.write(User.boxName, user);
        _userBox.save();
        return user;
      } else {
        return null;
      }
    });
  }
}