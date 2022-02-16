// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'banner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Banner _$BannerFromJson(Map<String, dynamic> json) {
  return _Banner.fromJson(json);
}

/// @nodoc
class _$BannerTearOff {
  const _$BannerTearOff();

  _Banner call(
      {required String description,
      required String dialogTitle,
      required String documentId,
      required String imageUrl,
      required String redirectUrl}) {
    return _Banner(
      description: description,
      dialogTitle: dialogTitle,
      documentId: documentId,
      imageUrl: imageUrl,
      redirectUrl: redirectUrl,
    );
  }

  Banner fromJson(Map<String, Object?> json) {
    return Banner.fromJson(json);
  }
}

/// @nodoc
const $Banner = _$BannerTearOff();

/// @nodoc
mixin _$Banner {
  String get description => throw _privateConstructorUsedError;
  String get dialogTitle => throw _privateConstructorUsedError;
  String get documentId => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get redirectUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BannerCopyWith<Banner> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannerCopyWith<$Res> {
  factory $BannerCopyWith(Banner value, $Res Function(Banner) then) =
      _$BannerCopyWithImpl<$Res>;
  $Res call(
      {String description,
      String dialogTitle,
      String documentId,
      String imageUrl,
      String redirectUrl});
}

/// @nodoc
class _$BannerCopyWithImpl<$Res> implements $BannerCopyWith<$Res> {
  _$BannerCopyWithImpl(this._value, this._then);

  final Banner _value;
  // ignore: unused_field
  final $Res Function(Banner) _then;

  @override
  $Res call({
    Object? description = freezed,
    Object? dialogTitle = freezed,
    Object? documentId = freezed,
    Object? imageUrl = freezed,
    Object? redirectUrl = freezed,
  }) {
    return _then(_value.copyWith(
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      dialogTitle: dialogTitle == freezed
          ? _value.dialogTitle
          : dialogTitle // ignore: cast_nullable_to_non_nullable
              as String,
      documentId: documentId == freezed
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      redirectUrl: redirectUrl == freezed
          ? _value.redirectUrl
          : redirectUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$BannerCopyWith<$Res> implements $BannerCopyWith<$Res> {
  factory _$BannerCopyWith(_Banner value, $Res Function(_Banner) then) =
      __$BannerCopyWithImpl<$Res>;
  @override
  $Res call(
      {String description,
      String dialogTitle,
      String documentId,
      String imageUrl,
      String redirectUrl});
}

/// @nodoc
class __$BannerCopyWithImpl<$Res> extends _$BannerCopyWithImpl<$Res>
    implements _$BannerCopyWith<$Res> {
  __$BannerCopyWithImpl(_Banner _value, $Res Function(_Banner) _then)
      : super(_value, (v) => _then(v as _Banner));

  @override
  _Banner get _value => super._value as _Banner;

  @override
  $Res call({
    Object? description = freezed,
    Object? dialogTitle = freezed,
    Object? documentId = freezed,
    Object? imageUrl = freezed,
    Object? redirectUrl = freezed,
  }) {
    return _then(_Banner(
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      dialogTitle: dialogTitle == freezed
          ? _value.dialogTitle
          : dialogTitle // ignore: cast_nullable_to_non_nullable
              as String,
      documentId: documentId == freezed
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      redirectUrl: redirectUrl == freezed
          ? _value.redirectUrl
          : redirectUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Banner implements _Banner {
  _$_Banner(
      {required this.description,
      required this.dialogTitle,
      required this.documentId,
      required this.imageUrl,
      required this.redirectUrl});

  factory _$_Banner.fromJson(Map<String, dynamic> json) =>
      _$$_BannerFromJson(json);

  @override
  final String description;
  @override
  final String dialogTitle;
  @override
  final String documentId;
  @override
  final String imageUrl;
  @override
  final String redirectUrl;

  @override
  String toString() {
    return 'Banner(description: $description, dialogTitle: $dialogTitle, documentId: $documentId, imageUrl: $imageUrl, redirectUrl: $redirectUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Banner &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.dialogTitle, dialogTitle) &&
            const DeepCollectionEquality()
                .equals(other.documentId, documentId) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality()
                .equals(other.redirectUrl, redirectUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(dialogTitle),
      const DeepCollectionEquality().hash(documentId),
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(redirectUrl));

  @JsonKey(ignore: true)
  @override
  _$BannerCopyWith<_Banner> get copyWith =>
      __$BannerCopyWithImpl<_Banner>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BannerToJson(this);
  }
}

abstract class _Banner implements Banner {
  factory _Banner(
      {required String description,
      required String dialogTitle,
      required String documentId,
      required String imageUrl,
      required String redirectUrl}) = _$_Banner;

  factory _Banner.fromJson(Map<String, dynamic> json) = _$_Banner.fromJson;

  @override
  String get description;
  @override
  String get dialogTitle;
  @override
  String get documentId;
  @override
  String get imageUrl;
  @override
  String get redirectUrl;
  @override
  @JsonKey(ignore: true)
  _$BannerCopyWith<_Banner> get copyWith => throw _privateConstructorUsedError;
}
