import 'package:freezed_annotation/freezed_annotation.dart';

part 'manager_schedule.freezed.dart';
part 'manager_schedule.g.dart';

@freezed
class ManagerSchedule with _$ManagerSchedule {
  factory ManagerSchedule({
    required String dayOfWeek,
    required String kor,
    required String working,
    required int workingFinish,
    required int workingStart,
  }) = _ManagerSchedule;

  factory ManagerSchedule.fromJson(Map<String, dynamic> json) => _$ManagerScheduleFromJson(json);
}