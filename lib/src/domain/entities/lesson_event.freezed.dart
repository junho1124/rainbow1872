// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'lesson_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LessonEvent _$LessonEventFromJson(Map<String, dynamic> json) {
  return _LessonEvent.fromJson(json);
}

/// @nodoc
class _$LessonEventTearOff {
  const _$LessonEventTearOff();

  _LessonEvent call(
      {required Duration duration,
      required DateTime lessonTime,
      required bool isReserved,
      required bool isAvailable}) {
    return _LessonEvent(
      duration: duration,
      lessonTime: lessonTime,
      isReserved: isReserved,
      isAvailable: isAvailable,
    );
  }

  LessonEvent fromJson(Map<String, Object?> json) {
    return LessonEvent.fromJson(json);
  }
}

/// @nodoc
const $LessonEvent = _$LessonEventTearOff();

/// @nodoc
mixin _$LessonEvent {
  Duration get duration => throw _privateConstructorUsedError;
  DateTime get lessonTime => throw _privateConstructorUsedError;
  bool get isReserved => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LessonEventCopyWith<LessonEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonEventCopyWith<$Res> {
  factory $LessonEventCopyWith(
          LessonEvent value, $Res Function(LessonEvent) then) =
      _$LessonEventCopyWithImpl<$Res>;
  $Res call(
      {Duration duration,
      DateTime lessonTime,
      bool isReserved,
      bool isAvailable});
}

/// @nodoc
class _$LessonEventCopyWithImpl<$Res> implements $LessonEventCopyWith<$Res> {
  _$LessonEventCopyWithImpl(this._value, this._then);

  final LessonEvent _value;
  // ignore: unused_field
  final $Res Function(LessonEvent) _then;

  @override
  $Res call({
    Object? duration = freezed,
    Object? lessonTime = freezed,
    Object? isReserved = freezed,
    Object? isAvailable = freezed,
  }) {
    return _then(_value.copyWith(
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      lessonTime: lessonTime == freezed
          ? _value.lessonTime
          : lessonTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isReserved: isReserved == freezed
          ? _value.isReserved
          : isReserved // ignore: cast_nullable_to_non_nullable
              as bool,
      isAvailable: isAvailable == freezed
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$LessonEventCopyWith<$Res>
    implements $LessonEventCopyWith<$Res> {
  factory _$LessonEventCopyWith(
          _LessonEvent value, $Res Function(_LessonEvent) then) =
      __$LessonEventCopyWithImpl<$Res>;
  @override
  $Res call(
      {Duration duration,
      DateTime lessonTime,
      bool isReserved,
      bool isAvailable});
}

/// @nodoc
class __$LessonEventCopyWithImpl<$Res> extends _$LessonEventCopyWithImpl<$Res>
    implements _$LessonEventCopyWith<$Res> {
  __$LessonEventCopyWithImpl(
      _LessonEvent _value, $Res Function(_LessonEvent) _then)
      : super(_value, (v) => _then(v as _LessonEvent));

  @override
  _LessonEvent get _value => super._value as _LessonEvent;

  @override
  $Res call({
    Object? duration = freezed,
    Object? lessonTime = freezed,
    Object? isReserved = freezed,
    Object? isAvailable = freezed,
  }) {
    return _then(_LessonEvent(
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      lessonTime: lessonTime == freezed
          ? _value.lessonTime
          : lessonTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isReserved: isReserved == freezed
          ? _value.isReserved
          : isReserved // ignore: cast_nullable_to_non_nullable
              as bool,
      isAvailable: isAvailable == freezed
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LessonEvent implements _LessonEvent {
  _$_LessonEvent(
      {required this.duration,
      required this.lessonTime,
      required this.isReserved,
      required this.isAvailable});

  factory _$_LessonEvent.fromJson(Map<String, dynamic> json) =>
      _$$_LessonEventFromJson(json);

  @override
  final Duration duration;
  @override
  final DateTime lessonTime;
  @override
  final bool isReserved;
  @override
  final bool isAvailable;

  @override
  String toString() {
    return 'LessonEvent(duration: $duration, lessonTime: $lessonTime, isReserved: $isReserved, isAvailable: $isAvailable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LessonEvent &&
            const DeepCollectionEquality().equals(other.duration, duration) &&
            const DeepCollectionEquality()
                .equals(other.lessonTime, lessonTime) &&
            const DeepCollectionEquality()
                .equals(other.isReserved, isReserved) &&
            const DeepCollectionEquality()
                .equals(other.isAvailable, isAvailable));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(duration),
      const DeepCollectionEquality().hash(lessonTime),
      const DeepCollectionEquality().hash(isReserved),
      const DeepCollectionEquality().hash(isAvailable));

  @JsonKey(ignore: true)
  @override
  _$LessonEventCopyWith<_LessonEvent> get copyWith =>
      __$LessonEventCopyWithImpl<_LessonEvent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LessonEventToJson(this);
  }
}

abstract class _LessonEvent implements LessonEvent {
  factory _LessonEvent(
      {required Duration duration,
      required DateTime lessonTime,
      required bool isReserved,
      required bool isAvailable}) = _$_LessonEvent;

  factory _LessonEvent.fromJson(Map<String, dynamic> json) =
      _$_LessonEvent.fromJson;

  @override
  Duration get duration;
  @override
  DateTime get lessonTime;
  @override
  bool get isReserved;
  @override
  bool get isAvailable;
  @override
  @JsonKey(ignore: true)
  _$LessonEventCopyWith<_LessonEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
