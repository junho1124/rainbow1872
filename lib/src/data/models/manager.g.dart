// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manager.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Manager _$$_ManagerFromJson(Map<String, dynamic> json) => _$_Manager(
      branch: json['branch'] as String,
      closeToday: json['closeToday'] as int?,
      email: json['email'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      position: json['position'] as String,
      proUrl: json['proUrl'] as String?,
      profileImg: json['profileImg'] as String?,
      restFinish: json['restFinish'] as int?,
      restStart: json['restStart'] as int?,
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$$_ManagerToJson(_$_Manager instance) =>
    <String, dynamic>{
      'branch': instance.branch,
      'closeToday': instance.closeToday,
      'email': instance.email,
      'name': instance.name,
      'phone': instance.phone,
      'position': instance.position,
      'proUrl': instance.proUrl,
      'profileImg': instance.profileImg,
      'restFinish': instance.restFinish,
      'restStart': instance.restStart,
      'uid': instance.uid,
    };
