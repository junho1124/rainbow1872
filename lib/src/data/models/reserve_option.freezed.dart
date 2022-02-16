// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reserve_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReserveOption _$ReserveOptionFromJson(Map<String, dynamic> json) {
  return _ReserveOption.fromJson(json);
}

/// @nodoc
class _$ReserveOptionTearOff {
  const _$ReserveOptionTearOff();

  _ReserveOption call(
      {required bool cancelable,
      required String optionName,
      required int reservePeriod,
      required int reserveTime,
      required bool today}) {
    return _ReserveOption(
      cancelable: cancelable,
      optionName: optionName,
      reservePeriod: reservePeriod,
      reserveTime: reserveTime,
      today: today,
    );
  }

  ReserveOption fromJson(Map<String, Object?> json) {
    return ReserveOption.fromJson(json);
  }
}

/// @nodoc
const $ReserveOption = _$ReserveOptionTearOff();

/// @nodoc
mixin _$ReserveOption {
  bool get cancelable => throw _privateConstructorUsedError;
  String get optionName => throw _privateConstructorUsedError;
  int get reservePeriod => throw _privateConstructorUsedError;
  int get reserveTime => throw _privateConstructorUsedError;
  bool get today => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReserveOptionCopyWith<ReserveOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReserveOptionCopyWith<$Res> {
  factory $ReserveOptionCopyWith(
          ReserveOption value, $Res Function(ReserveOption) then) =
      _$ReserveOptionCopyWithImpl<$Res>;
  $Res call(
      {bool cancelable,
      String optionName,
      int reservePeriod,
      int reserveTime,
      bool today});
}

/// @nodoc
class _$ReserveOptionCopyWithImpl<$Res>
    implements $ReserveOptionCopyWith<$Res> {
  _$ReserveOptionCopyWithImpl(this._value, this._then);

  final ReserveOption _value;
  // ignore: unused_field
  final $Res Function(ReserveOption) _then;

  @override
  $Res call({
    Object? cancelable = freezed,
    Object? optionName = freezed,
    Object? reservePeriod = freezed,
    Object? reserveTime = freezed,
    Object? today = freezed,
  }) {
    return _then(_value.copyWith(
      cancelable: cancelable == freezed
          ? _value.cancelable
          : cancelable // ignore: cast_nullable_to_non_nullable
              as bool,
      optionName: optionName == freezed
          ? _value.optionName
          : optionName // ignore: cast_nullable_to_non_nullable
              as String,
      reservePeriod: reservePeriod == freezed
          ? _value.reservePeriod
          : reservePeriod // ignore: cast_nullable_to_non_nullable
              as int,
      reserveTime: reserveTime == freezed
          ? _value.reserveTime
          : reserveTime // ignore: cast_nullable_to_non_nullable
              as int,
      today: today == freezed
          ? _value.today
          : today // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$ReserveOptionCopyWith<$Res>
    implements $ReserveOptionCopyWith<$Res> {
  factory _$ReserveOptionCopyWith(
          _ReserveOption value, $Res Function(_ReserveOption) then) =
      __$ReserveOptionCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool cancelable,
      String optionName,
      int reservePeriod,
      int reserveTime,
      bool today});
}

/// @nodoc
class __$ReserveOptionCopyWithImpl<$Res>
    extends _$ReserveOptionCopyWithImpl<$Res>
    implements _$ReserveOptionCopyWith<$Res> {
  __$ReserveOptionCopyWithImpl(
      _ReserveOption _value, $Res Function(_ReserveOption) _then)
      : super(_value, (v) => _then(v as _ReserveOption));

  @override
  _ReserveOption get _value => super._value as _ReserveOption;

  @override
  $Res call({
    Object? cancelable = freezed,
    Object? optionName = freezed,
    Object? reservePeriod = freezed,
    Object? reserveTime = freezed,
    Object? today = freezed,
  }) {
    return _then(_ReserveOption(
      cancelable: cancelable == freezed
          ? _value.cancelable
          : cancelable // ignore: cast_nullable_to_non_nullable
              as bool,
      optionName: optionName == freezed
          ? _value.optionName
          : optionName // ignore: cast_nullable_to_non_nullable
              as String,
      reservePeriod: reservePeriod == freezed
          ? _value.reservePeriod
          : reservePeriod // ignore: cast_nullable_to_non_nullable
              as int,
      reserveTime: reserveTime == freezed
          ? _value.reserveTime
          : reserveTime // ignore: cast_nullable_to_non_nullable
              as int,
      today: today == freezed
          ? _value.today
          : today // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReserveOption implements _ReserveOption {
  _$_ReserveOption(
      {required this.cancelable,
      required this.optionName,
      required this.reservePeriod,
      required this.reserveTime,
      required this.today});

  factory _$_ReserveOption.fromJson(Map<String, dynamic> json) =>
      _$$_ReserveOptionFromJson(json);

  @override
  final bool cancelable;
  @override
  final String optionName;
  @override
  final int reservePeriod;
  @override
  final int reserveTime;
  @override
  final bool today;

  @override
  String toString() {
    return 'ReserveOption(cancelable: $cancelable, optionName: $optionName, reservePeriod: $reservePeriod, reserveTime: $reserveTime, today: $today)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReserveOption &&
            const DeepCollectionEquality()
                .equals(other.cancelable, cancelable) &&
            const DeepCollectionEquality()
                .equals(other.optionName, optionName) &&
            const DeepCollectionEquality()
                .equals(other.reservePeriod, reservePeriod) &&
            const DeepCollectionEquality()
                .equals(other.reserveTime, reserveTime) &&
            const DeepCollectionEquality().equals(other.today, today));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(cancelable),
      const DeepCollectionEquality().hash(optionName),
      const DeepCollectionEquality().hash(reservePeriod),
      const DeepCollectionEquality().hash(reserveTime),
      const DeepCollectionEquality().hash(today));

  @JsonKey(ignore: true)
  @override
  _$ReserveOptionCopyWith<_ReserveOption> get copyWith =>
      __$ReserveOptionCopyWithImpl<_ReserveOption>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReserveOptionToJson(this);
  }
}

abstract class _ReserveOption implements ReserveOption {
  factory _ReserveOption(
      {required bool cancelable,
      required String optionName,
      required int reservePeriod,
      required int reserveTime,
      required bool today}) = _$_ReserveOption;

  factory _ReserveOption.fromJson(Map<String, dynamic> json) =
      _$_ReserveOption.fromJson;

  @override
  bool get cancelable;
  @override
  String get optionName;
  @override
  int get reservePeriod;
  @override
  int get reserveTime;
  @override
  bool get today;
  @override
  @JsonKey(ignore: true)
  _$ReserveOptionCopyWith<_ReserveOption> get copyWith =>
      throw _privateConstructorUsedError;
}
