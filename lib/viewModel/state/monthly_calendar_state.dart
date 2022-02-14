import 'package:freezed_annotation/freezed_annotation.dart';

part 'monthly_calendar_state.freezed.dart';

@freezed
class MonthlyCalenderState with _$MonthlyCalenderState {
  factory MonthlyCalenderState({
    required DateTime focusDay,
    required DateTime selectDay,
  }) = _MonthlyCalenderState;
}