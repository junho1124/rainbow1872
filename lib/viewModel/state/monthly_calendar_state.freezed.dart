// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'monthly_calendar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MonthlyCalenderStateTearOff {
  const _$MonthlyCalenderStateTearOff();

  _MonthlyCalenderState call(
      {required DateTime focusDay, required DateTime selectDay}) {
    return _MonthlyCalenderState(
      focusDay: focusDay,
      selectDay: selectDay,
    );
  }
}

/// @nodoc
const $MonthlyCalenderState = _$MonthlyCalenderStateTearOff();

/// @nodoc
mixin _$MonthlyCalenderState {
  DateTime get focusDay => throw _privateConstructorUsedError;
  DateTime get selectDay => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MonthlyCalenderStateCopyWith<MonthlyCalenderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlyCalenderStateCopyWith<$Res> {
  factory $MonthlyCalenderStateCopyWith(MonthlyCalenderState value,
          $Res Function(MonthlyCalenderState) then) =
      _$MonthlyCalenderStateCopyWithImpl<$Res>;
  $Res call({DateTime focusDay, DateTime selectDay});
}

/// @nodoc
class _$MonthlyCalenderStateCopyWithImpl<$Res>
    implements $MonthlyCalenderStateCopyWith<$Res> {
  _$MonthlyCalenderStateCopyWithImpl(this._value, this._then);

  final MonthlyCalenderState _value;
  // ignore: unused_field
  final $Res Function(MonthlyCalenderState) _then;

  @override
  $Res call({
    Object? focusDay = freezed,
    Object? selectDay = freezed,
  }) {
    return _then(_value.copyWith(
      focusDay: focusDay == freezed
          ? _value.focusDay
          : focusDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      selectDay: selectDay == freezed
          ? _value.selectDay
          : selectDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$MonthlyCalenderStateCopyWith<$Res>
    implements $MonthlyCalenderStateCopyWith<$Res> {
  factory _$MonthlyCalenderStateCopyWith(_MonthlyCalenderState value,
          $Res Function(_MonthlyCalenderState) then) =
      __$MonthlyCalenderStateCopyWithImpl<$Res>;
  @override
  $Res call({DateTime focusDay, DateTime selectDay});
}

/// @nodoc
class __$MonthlyCalenderStateCopyWithImpl<$Res>
    extends _$MonthlyCalenderStateCopyWithImpl<$Res>
    implements _$MonthlyCalenderStateCopyWith<$Res> {
  __$MonthlyCalenderStateCopyWithImpl(
      _MonthlyCalenderState _value, $Res Function(_MonthlyCalenderState) _then)
      : super(_value, (v) => _then(v as _MonthlyCalenderState));

  @override
  _MonthlyCalenderState get _value => super._value as _MonthlyCalenderState;

  @override
  $Res call({
    Object? focusDay = freezed,
    Object? selectDay = freezed,
  }) {
    return _then(_MonthlyCalenderState(
      focusDay: focusDay == freezed
          ? _value.focusDay
          : focusDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      selectDay: selectDay == freezed
          ? _value.selectDay
          : selectDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_MonthlyCalenderState implements _MonthlyCalenderState {
  _$_MonthlyCalenderState({required this.focusDay, required this.selectDay});

  @override
  final DateTime focusDay;
  @override
  final DateTime selectDay;

  @override
  String toString() {
    return 'MonthlyCalenderState(focusDay: $focusDay, selectDay: $selectDay)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MonthlyCalenderState &&
            const DeepCollectionEquality().equals(other.focusDay, focusDay) &&
            const DeepCollectionEquality().equals(other.selectDay, selectDay));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(focusDay),
      const DeepCollectionEquality().hash(selectDay));

  @JsonKey(ignore: true)
  @override
  _$MonthlyCalenderStateCopyWith<_MonthlyCalenderState> get copyWith =>
      __$MonthlyCalenderStateCopyWithImpl<_MonthlyCalenderState>(
          this, _$identity);
}

abstract class _MonthlyCalenderState implements MonthlyCalenderState {
  factory _MonthlyCalenderState(
      {required DateTime focusDay,
      required DateTime selectDay}) = _$_MonthlyCalenderState;

  @override
  DateTime get focusDay;
  @override
  DateTime get selectDay;
  @override
  @JsonKey(ignore: true)
  _$MonthlyCalenderStateCopyWith<_MonthlyCalenderState> get copyWith =>
      throw _privateConstructorUsedError;
}
