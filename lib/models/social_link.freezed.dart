// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_link.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SocialLink _$SocialLinkFromJson(Map<String, dynamic> json) {
  return _SocialLink.fromJson(json);
}

/// @nodoc
mixin _$SocialLink {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SocialLinkCopyWith<SocialLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialLinkCopyWith<$Res> {
  factory $SocialLinkCopyWith(
          SocialLink value, $Res Function(SocialLink) then) =
      _$SocialLinkCopyWithImpl<$Res, SocialLink>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$SocialLinkCopyWithImpl<$Res, $Val extends SocialLink>
    implements $SocialLinkCopyWith<$Res> {
  _$SocialLinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SocialLinkCopyWith<$Res>
    implements $SocialLinkCopyWith<$Res> {
  factory _$$_SocialLinkCopyWith(
          _$_SocialLink value, $Res Function(_$_SocialLink) then) =
      __$$_SocialLinkCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$_SocialLinkCopyWithImpl<$Res>
    extends _$SocialLinkCopyWithImpl<$Res, _$_SocialLink>
    implements _$$_SocialLinkCopyWith<$Res> {
  __$$_SocialLinkCopyWithImpl(
      _$_SocialLink _value, $Res Function(_$_SocialLink) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$_SocialLink(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SocialLink implements _SocialLink {
  const _$_SocialLink({required this.name, required this.url});

  factory _$_SocialLink.fromJson(Map<String, dynamic> json) =>
      _$$_SocialLinkFromJson(json);

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'SocialLink(name: $name, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SocialLink &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SocialLinkCopyWith<_$_SocialLink> get copyWith =>
      __$$_SocialLinkCopyWithImpl<_$_SocialLink>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SocialLinkToJson(
      this,
    );
  }
}

abstract class _SocialLink implements SocialLink {
  const factory _SocialLink(
      {required final String name, required final String url}) = _$_SocialLink;

  factory _SocialLink.fromJson(Map<String, dynamic> json) =
      _$_SocialLink.fromJson;

  @override
  String get name;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_SocialLinkCopyWith<_$_SocialLink> get copyWith =>
      throw _privateConstructorUsedError;
}
