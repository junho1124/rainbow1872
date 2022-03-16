import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class ProfileRepository {
  final _fireStorage = FirebaseStorage.instance;

  Future<String> uploadImage(File file, String uid) async {
    return await _fireStorage.ref("profileImage").child("$uid.jpg").putFile(file).then((value) async {
      return await value.ref.getDownloadURL();
    });
  }
}