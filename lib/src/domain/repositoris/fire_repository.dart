import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FireRepository<T> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future get(String key) async {}

  Future update(T item) async {}
}