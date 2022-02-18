import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  static const boxName = "User";
  static const uidBoxName = "UserUid";
  factory User({
    required String ableReservation,
    required bool available,
    required String branch,
    required int birth,
    required String email,
    required String gender,
    required bool lessonAvailable,
    required int lessonCancelCount,
    required int lessonMembership,
    required int lessonMembershipEnd,
    required int lessonMembershipPeriod,
    required int lessonMembershipStart,
    required String lessonMembershipType,
    required int lessonMembershipUsed,
    required String memo,
    required String name,
    required String phone,
    required int point,
    required String pro,
    required String proUid,
    String? profileImg,
    required String uid,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

