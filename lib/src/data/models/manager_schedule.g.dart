// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manager_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ManagerSchedule _$$_ManagerScheduleFromJson(Map<String, dynamic> json) =>
    _$_ManagerSchedule(
      dayOfWeek: json['dayOfWeek'] as String,
      kor: json['kor'] as String,
      working: json['working'] as String,
      restStart: json['restStart'] as int?,
      restFinish: json['restFinish'] as int?,
      workingFinish: json['workingFinish'] as int,
      workingStart: json['workingStart'] as int,
    );

Map<String, dynamic> _$$_ManagerScheduleToJson(_$_ManagerSchedule instance) =>
    <String, dynamic>{
      'dayOfWeek': instance.dayOfWeek,
      'kor': instance.kor,
      'working': instance.working,
      'restStart': instance.restStart,
      'restFinish': instance.restFinish,
      'workingFinish': instance.workingFinish,
      'workingStart': instance.workingStart,
    };
