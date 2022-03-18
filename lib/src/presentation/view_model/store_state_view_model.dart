import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rainbow1872/src/data/models/branch.dart';
import 'package:rainbow1872/src/data/models/user.dart';
import 'package:rainbow1872/src/data/repositoris/branch_repository.dart';
import 'package:url_launcher/url_launcher.dart';

class StoreStateViewModel extends GetxController {
  final _branchRepository = BranchRepository();

  final _userBox = GetStorage(User.boxName);
  late User user;
  late Branch branch;

  var isLoaded = false.obs;

  @override
  void onInit() async {
    user = await _userBox.read(User.boxName);
    branch = await _branchRepository.get(user.branch);
    isLoaded.value = true;
    super.onInit();
  }

  void callToBranch() async {
    String uri = "tel:${branch.phone.replaceAll("-", "")}";
    if(await canLaunch(uri)) {
      launch(uri);
    } else {
      Get.showSnackbar(GetSnackBar(message: "전화를 걸 수 없습니다.", duration: Duration(seconds: 2),));
    }
  }
}