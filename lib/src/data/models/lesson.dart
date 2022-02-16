import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson.freezed.dart';
part 'lesson.g.dart';

@freezed
class Lesson with _$Lesson {
  factory Lesson({
    required int checkedTime,
    required String coachUid,
    required int lessonDateTime,
    required String lessonMemo,
    required String lessonNote,
    required int lessontime,
    required bool memberChecked,
    required String type,
    required String uid,
  }) = _Lesson;

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);
}