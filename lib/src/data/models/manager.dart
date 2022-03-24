import 'package:freezed_annotation/freezed_annotation.dart';

part 'manager.freezed.dart';
part 'manager.g.dart';

@freezed
class Manager with _$Manager {
  static const String boxName = "Manager";
  factory Manager({
    required String branch,
    required int? closeToday,
    required String email,
    required String name,
    required String phone,
    required String position,
    required String? proUrl,
    required String? profileImg,
    required int? restFinish,
    required int? restStart,
    required String uid
  }) = _Manager;

  factory Manager.fromJson(Map<String, dynamic> json) => _$ManagerFromJson(json);
}