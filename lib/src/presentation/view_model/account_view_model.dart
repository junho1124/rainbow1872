import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rainbow1872/src/data/models/branch.dart';
import 'package:rainbow1872/src/data/models/manager.dart';
import 'package:rainbow1872/src/data/models/user.dart';
import 'package:rainbow1872/src/data/repositoris/branch_repository.dart';
import 'package:rainbow1872/src/data/repositoris/profile_repository.dart';
import 'package:rainbow1872/src/data/repositoris/user_repository.dart';

class AccountViewModel extends GetxController {
  final _userBox = GetStorage(User.boxName);
  final _managerBox = GetStorage(Manager.boxName);
  final _profileRepository = ProfileRepository();
  final _userRepository = UserRepository();
  final _branchRepository = BranchRepository();

  late User user;
  late Manager manager;
  late Branch branch;

  RxBool isLoaded = false.obs;
  @override
  void onInit() async {
    user = await _userBox.read(User.boxName);
    manager = await _managerBox.read(Manager.boxName);
    branch = await _branchRepository.get(user.branch);
    isLoaded.value = true;
    super.onInit();
  }

  Future getProfileImage() async {
    ImagePicker picker = ImagePicker();
    final imageCropper = ImageCropper();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if(image != null) {
      await imageCropper.cropImage(sourcePath: image.path).then((value) async {
        if(value != null) {
          await _profileRepository.uploadImage(value, user.uid).then((value) async {
            user = user.copyWith(profileImg: value);
            await _userRepository.update(user);
            update();
          });
        }
      });
    }
  }
}