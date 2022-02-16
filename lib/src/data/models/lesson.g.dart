// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Lesson _$$_LessonFromJson(Map<String, dynamic> json) => _$_Lesson(
      checkedTime: json['checkedTime'] as int,
      coachUid: json['coachUid'] as String,
      lessonDateTime: json['lessonDateTime'] as int,
      lessonMemo: json['lessonMemo'] as String,
      lessonNote: json['lessonNote'] as String,
      lessontime: json['lessontime'] as int,
      memberChecked: json['memberChecked'] as bool,
      type: json['type'] as String,
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$$_LessonToJson(_$_Lesson instance) => <String, dynamic>{
      'checkedTime': instance.checkedTime,
      'coachUid': instance.coachUid,
      'lessonDateTime': instance.lessonDateTime,
      'lessonMemo': instance.lessonMemo,
      'lessonNote': instance.lessonNote,
      'lessontime': instance.lessontime,
      'memberChecked': instance.memberChecked,
      'type': instance.type,
      'uid': instance.uid,
    };
