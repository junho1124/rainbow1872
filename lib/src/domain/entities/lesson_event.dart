import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson_event.freezed.dart';
part 'lesson_event.g.dart';

@freezed
class LessonEvent with _$LessonEvent {
  factory LessonEvent({
    required Duration duration,
    required DateTime lessonTime,
    required bool isReserved,
    required bool isAvailable,
  }) = _LessonEvent;

  factory LessonEvent.fromJson(Map<String, dynamic> json) => _$LessonEventFromJson(json);
}