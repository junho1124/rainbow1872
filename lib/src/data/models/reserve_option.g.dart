// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reserve_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReserveOption _$$_ReserveOptionFromJson(Map<String, dynamic> json) =>
    _$_ReserveOption(
      cancelable: json['cancelable'] as bool,
      optionName: json['optionName'] as String,
      reservePeriod: json['reservePeriod'] as int,
      reserveTime: json['reserveTime'] as int,
      today: json['today'] as bool,
    );

Map<String, dynamic> _$$_ReserveOptionToJson(_$_ReserveOption instance) =>
    <String, dynamic>{
      'cancelable': instance.cancelable,
      'optionName': instance.optionName,
      'reservePeriod': instance.reservePeriod,
      'reserveTime': instance.reserveTime,
      'today': instance.today,
    };
