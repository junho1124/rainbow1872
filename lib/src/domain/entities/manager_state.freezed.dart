// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'manager_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ManagerStateTearOff {
  const _$ManagerStateTearOff();

  _ManagerState call({required Color stateColor, required String state}) {
    return _ManagerState(
      stateColor: stateColor,
      state: state,
    );
  }
}

/// @nodoc
const $ManagerState = _$ManagerStateTearOff();

/// @nodoc
mixin _$ManagerState {
  Color get stateColor => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ManagerStateCopyWith<ManagerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManagerStateCopyWith<$Res> {
  factory $ManagerStateCopyWith(
          ManagerState value, $Res Function(ManagerState) then) =
      _$ManagerStateCopyWithImpl<$Res>;
  $Res call({Color stateColor, String state});
}

/// @nodoc
class _$ManagerStateCopyWithImpl<$Res> implements $ManagerStateCopyWith<$Res> {
  _$ManagerStateCopyWithImpl(this._value, this._then);

  final ManagerState _value;
  // ignore: unused_field
  final $Res Function(ManagerState) _then;

  @override
  $Res call({
    Object? stateColor = freezed,
    Object? state = freezed,
  }) {
    return _then(_value.copyWith(
      stateColor: stateColor == freezed
          ? _value.stateColor
          : stateColor // ignore: cast_nullable_to_non_nullable
              as Color,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ManagerStateCopyWith<$Res>
    implements $ManagerStateCopyWith<$Res> {
  factory _$ManagerStateCopyWith(
          _ManagerState value, $Res Function(_ManagerState) then) =
      __$ManagerStateCopyWithImpl<$Res>;
  @override
  $Res call({Color stateColor, String state});
}

/// @nodoc
class __$ManagerStateCopyWithImpl<$Res> extends _$ManagerStateCopyWithImpl<$Res>
    implements _$ManagerStateCopyWith<$Res> {
  __$ManagerStateCopyWithImpl(
      _ManagerState _value, $Res Function(_ManagerState) _then)
      : super(_value, (v) => _then(v as _ManagerState));

  @override
  _ManagerState get _value => super._value as _ManagerState;

  @override
  $Res call({
    Object? stateColor = freezed,
    Object? state = freezed,
  }) {
    return _then(_ManagerState(
      stateColor: stateColor == freezed
          ? _value.stateColor
          : stateColor // ignore: cast_nullable_to_non_nullable
              as Color,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ManagerState implements _ManagerState {
  _$_ManagerState({required this.stateColor, required this.state});

  @override
  final Color stateColor;
  @override
  final String state;

  @override
  String toString() {
    return 'ManagerState(stateColor: $stateColor, state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ManagerState &&
            const DeepCollectionEquality()
                .equals(other.stateColor, stateColor) &&
            const DeepCollectionEquality().equals(other.state, state));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(stateColor),
      const DeepCollectionEquality().hash(state));

  @JsonKey(ignore: true)
  @override
  _$ManagerStateCopyWith<_ManagerState> get copyWith =>
      __$ManagerStateCopyWithImpl<_ManagerState>(this, _$identity);
}

abstract class _ManagerState implements ManagerState {
  factory _ManagerState({required Color stateColor, required String state}) =
      _$_ManagerState;

  @override
  Color get stateColor;
  @override
  String get state;
  @override
  @JsonKey(ignore: true)
  _$ManagerStateCopyWith<_ManagerState> get copyWith =>
      throw _privateConstructorUsedError;
}
