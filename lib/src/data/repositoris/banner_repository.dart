import 'package:rainbow1872/src/data/models/banner.dart';
import 'package:rainbow1872/src/domain/repositoris/fire_repository.dart';

class BannerRepository extends FireRepository<Banner> {
  Future<List<Banner>> getAll() async {
    return await super.db.collection("banner").get().then((value) {
      List<Banner> result = [];
      for(var item in value.docs) {
        result.add(Banner.fromJson(item.data()));
      }
      return result;
    });
  }
}