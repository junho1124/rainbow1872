import 'package:freezed_annotation/freezed_annotation.dart';

part 'reserve_option.freezed.dart';
part 'reserve_option.g.dart';

@freezed
class ReserveOption with _$ReserveOption {
  factory ReserveOption({
    required bool cancelable,
    required String optionName,
    required int reservePeriod,
    required int reserveTime,
    required bool today
  }) = _ReserveOption;

  factory ReserveOption.fromJson(Map<String, dynamic> json) => _$ReserveOptionFromJson(json);
}

