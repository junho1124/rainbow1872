// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      ableReservation: json['ableReservation'] as String,
      available: json['available'] as bool,
      branch: json['branch'] as String,
      birth: json['birth'] as int,
      email: json['email'] as String,
      gender: json['gender'] as String,
      lessonAvailable: json['lessonAvailable'] as bool,
      lessonCancelCount: json['lessonCancelCount'] as int,
      lessonMembership: json['lessonMembership'] as int,
      lessonMembershipEnd: json['lessonMembershipEnd'] as int,
      lessonMembershipPeriod: json['lessonMembershipPeriod'] as int,
      lessonMembershipStart: json['lessonMembershipStart'] as int,
      lessonMembershipType: json['lessonMembershipType'] as String,
      lessonMembershipUsed: json['lessonMembershipUsed'] as int,
      memo: json['memo'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      point: json['point'] as int,
      pro: json['pro'] as String,
      proUid: json['proUid'] as String,
      profileImg: json['profileImg'] as String?,
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'ableReservation': instance.ableReservation,
      'available': instance.available,
      'branch': instance.branch,
      'birth': instance.birth,
      'email': instance.email,
      'gender': instance.gender,
      'lessonAvailable': instance.lessonAvailable,
      'lessonCancelCount': instance.lessonCancelCount,
      'lessonMembership': instance.lessonMembership,
      'lessonMembershipEnd': instance.lessonMembershipEnd,
      'lessonMembershipPeriod': instance.lessonMembershipPeriod,
      'lessonMembershipStart': instance.lessonMembershipStart,
      'lessonMembershipType': instance.lessonMembershipType,
      'lessonMembershipUsed': instance.lessonMembershipUsed,
      'memo': instance.memo,
      'name': instance.name,
      'phone': instance.phone,
      'point': instance.point,
      'pro': instance.pro,
      'proUid': instance.proUid,
      'profileImg': instance.profileImg,
      'uid': instance.uid,
    };
