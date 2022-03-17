// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'manager_schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ManagerSchedule _$ManagerScheduleFromJson(Map<String, dynamic> json) {
  return _ManagerSchedule.fromJson(json);
}

/// @nodoc
class _$ManagerScheduleTearOff {
  const _$ManagerScheduleTearOff();

  _ManagerSchedule call(
      {required String dayOfWeek,
      required String kor,
      required String working,
      required int? restStart,
      required int? restFinish,
      required int workingFinish,
      required int workingStart}) {
    return _ManagerSchedule(
      dayOfWeek: dayOfWeek,
      kor: kor,
      working: working,
      restStart: restStart,
      restFinish: restFinish,
      workingFinish: workingFinish,
      workingStart: workingStart,
    );
  }

  ManagerSchedule fromJson(Map<String, Object?> json) {
    return ManagerSchedule.fromJson(json);
  }
}

/// @nodoc
const $ManagerSchedule = _$ManagerScheduleTearOff();

/// @nodoc
mixin _$ManagerSchedule {
  String get dayOfWeek => throw _privateConstructorUsedError;
  String get kor => throw _privateConstructorUsedError;
  String get working => throw _privateConstructorUsedError;
  int? get restStart => throw _privateConstructorUsedError;
  int? get restFinish => throw _privateConstructorUsedError;
  int get workingFinish => throw _privateConstructorUsedError;
  int get workingStart => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ManagerScheduleCopyWith<ManagerSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManagerScheduleCopyWith<$Res> {
  factory $ManagerScheduleCopyWith(
          ManagerSchedule value, $Res Function(ManagerSchedule) then) =
      _$ManagerScheduleCopyWithImpl<$Res>;
  $Res call(
      {String dayOfWeek,
      String kor,
      String working,
      int? restStart,
      int? restFinish,
      int workingFinish,
      int workingStart});
}

/// @nodoc
class _$ManagerScheduleCopyWithImpl<$Res>
    implements $ManagerScheduleCopyWith<$Res> {
  _$ManagerScheduleCopyWithImpl(this._value, this._then);

  final ManagerSchedule _value;
  // ignore: unused_field
  final $Res Function(ManagerSchedule) _then;

  @override
  $Res call({
    Object? dayOfWeek = freezed,
    Object? kor = freezed,
    Object? working = freezed,
    Object? restStart = freezed,
    Object? restFinish = freezed,
    Object? workingFinish = freezed,
    Object? workingStart = freezed,
  }) {
    return _then(_value.copyWith(
      dayOfWeek: dayOfWeek == freezed
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as String,
      kor: kor == freezed
          ? _value.kor
          : kor // ignore: cast_nullable_to_non_nullable
              as String,
      working: working == freezed
          ? _value.working
          : working // ignore: cast_nullable_to_non_nullable
              as String,
      restStart: restStart == freezed
          ? _value.restStart
          : restStart // ignore: cast_nullable_to_non_nullable
              as int?,
      restFinish: restFinish == freezed
          ? _value.restFinish
          : restFinish // ignore: cast_nullable_to_non_nullable
              as int?,
      workingFinish: workingFinish == freezed
          ? _value.workingFinish
          : workingFinish // ignore: cast_nullable_to_non_nullable
              as int,
      workingStart: workingStart == freezed
          ? _value.workingStart
          : workingStart // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$ManagerScheduleCopyWith<$Res>
    implements $ManagerScheduleCopyWith<$Res> {
  factory _$ManagerScheduleCopyWith(
          _ManagerSchedule value, $Res Function(_ManagerSchedule) then) =
      __$ManagerScheduleCopyWithImpl<$Res>;
  @override
  $Res call(
      {String dayOfWeek,
      String kor,
      String working,
      int? restStart,
      int? restFinish,
      int workingFinish,
      int workingStart});
}

/// @nodoc
class __$ManagerScheduleCopyWithImpl<$Res>
    extends _$ManagerScheduleCopyWithImpl<$Res>
    implements _$ManagerScheduleCopyWith<$Res> {
  __$ManagerScheduleCopyWithImpl(
      _ManagerSchedule _value, $Res Function(_ManagerSchedule) _then)
      : super(_value, (v) => _then(v as _ManagerSchedule));

  @override
  _ManagerSchedule get _value => super._value as _ManagerSchedule;

  @override
  $Res call({
    Object? dayOfWeek = freezed,
    Object? kor = freezed,
    Object? working = freezed,
    Object? restStart = freezed,
    Object? restFinish = freezed,
    Object? workingFinish = freezed,
    Object? workingStart = freezed,
  }) {
    return _then(_ManagerSchedule(
      dayOfWeek: dayOfWeek == freezed
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as String,
      kor: kor == freezed
          ? _value.kor
          : kor // ignore: cast_nullable_to_non_nullable
              as String,
      working: working == freezed
          ? _value.working
          : working // ignore: cast_nullable_to_non_nullable
              as String,
      restStart: restStart == freezed
          ? _value.restStart
          : restStart // ignore: cast_nullable_to_non_nullable
              as int?,
      restFinish: restFinish == freezed
          ? _value.restFinish
          : restFinish // ignore: cast_nullable_to_non_nullable
              as int?,
      workingFinish: workingFinish == freezed
          ? _value.workingFinish
          : workingFinish // ignore: cast_nullable_to_non_nullable
              as int,
      workingStart: workingStart == freezed
          ? _value.workingStart
          : workingStart // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ManagerSchedule implements _ManagerSchedule {
  _$_ManagerSchedule(
      {required this.dayOfWeek,
      required this.kor,
      required this.working,
      required this.restStart,
      required this.restFinish,
      required this.workingFinish,
      required this.workingStart});

  factory _$_ManagerSchedule.fromJson(Map<String, dynamic> json) =>
      _$$_ManagerScheduleFromJson(json);

  @override
  final String dayOfWeek;
  @override
  final String kor;
  @override
  final String working;
  @override
  final int? restStart;
  @override
  final int? restFinish;
  @override
  final int workingFinish;
  @override
  final int workingStart;

  @override
  String toString() {
    return 'ManagerSchedule(dayOfWeek: $dayOfWeek, kor: $kor, working: $working, restStart: $restStart, restFinish: $restFinish, workingFinish: $workingFinish, workingStart: $workingStart)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ManagerSchedule &&
            const DeepCollectionEquality().equals(other.dayOfWeek, dayOfWeek) &&
            const DeepCollectionEquality().equals(other.kor, kor) &&
            const DeepCollectionEquality().equals(other.working, working) &&
            const DeepCollectionEquality().equals(other.restStart, restStart) &&
            const DeepCollectionEquality()
                .equals(other.restFinish, restFinish) &&
            const DeepCollectionEquality()
                .equals(other.workingFinish, workingFinish) &&
            const DeepCollectionEquality()
                .equals(other.workingStart, workingStart));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(dayOfWeek),
      const DeepCollectionEquality().hash(kor),
      const DeepCollectionEquality().hash(working),
      const DeepCollectionEquality().hash(restStart),
      const DeepCollectionEquality().hash(restFinish),
      const DeepCollectionEquality().hash(workingFinish),
      const DeepCollectionEquality().hash(workingStart));

  @JsonKey(ignore: true)
  @override
  _$ManagerScheduleCopyWith<_ManagerSchedule> get copyWith =>
      __$ManagerScheduleCopyWithImpl<_ManagerSchedule>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ManagerScheduleToJson(this);
  }
}

abstract class _ManagerSchedule implements ManagerSchedule {
  factory _ManagerSchedule(
      {required String dayOfWeek,
      required String kor,
      required String working,
      required int? restStart,
      required int? restFinish,
      required int workingFinish,
      required int workingStart}) = _$_ManagerSchedule;

  factory _ManagerSchedule.fromJson(Map<String, dynamic> json) =
      _$_ManagerSchedule.fromJson;

  @override
  String get dayOfWeek;
  @override
  String get kor;
  @override
  String get working;
  @override
  int? get restStart;
  @override
  int? get restFinish;
  @override
  int get workingFinish;
  @override
  int get workingStart;
  @override
  @JsonKey(ignore: true)
  _$ManagerScheduleCopyWith<_ManagerSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}
