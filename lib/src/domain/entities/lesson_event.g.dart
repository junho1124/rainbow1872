// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LessonEvent _$$_LessonEventFromJson(Map<String, dynamic> json) =>
    _$_LessonEvent(
      duration: Duration(microseconds: json['duration'] as int),
      lessonTime: DateTime.parse(json['lessonTime'] as String),
      isReserved: json['isReserved'] as bool,
      isAvailable: json['isAvailable'] as bool,
    );

Map<String, dynamic> _$$_LessonEventToJson(_$_LessonEvent instance) =>
    <String, dynamic>{
      'duration': instance.duration.inMicroseconds,
      'lessonTime': instance.lessonTime.toIso8601String(),
      'isReserved': instance.isReserved,
      'isAvailable': instance.isAvailable,
    };
