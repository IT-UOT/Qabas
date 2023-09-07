// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team_member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TeamMemberModel _$TeamMemberModelFromJson(Map<String, dynamic> json) {
  return _TeamMemberModel.fromJson(json);
}

/// @nodoc
mixin _$TeamMemberModel {
  String get name => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String get bio => throw _privateConstructorUsedError;
  List<SocialLink> get links => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeamMemberModelCopyWith<TeamMemberModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamMemberModelCopyWith<$Res> {
  factory $TeamMemberModelCopyWith(
          TeamMemberModel value, $Res Function(TeamMemberModel) then) =
      _$TeamMemberModelCopyWithImpl<$Res, TeamMemberModel>;
  @useResult
  $Res call({String name, String role, String bio, List<SocialLink> links});
}

/// @nodoc
class _$TeamMemberModelCopyWithImpl<$Res, $Val extends TeamMemberModel>
    implements $TeamMemberModelCopyWith<$Res> {
  _$TeamMemberModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? role = null,
    Object? bio = null,
    Object? links = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<SocialLink>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TeamMemberModelCopyWith<$Res>
    implements $TeamMemberModelCopyWith<$Res> {
  factory _$$_TeamMemberModelCopyWith(
          _$_TeamMemberModel value, $Res Function(_$_TeamMemberModel) then) =
      __$$_TeamMemberModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String role, String bio, List<SocialLink> links});
}

/// @nodoc
class __$$_TeamMemberModelCopyWithImpl<$Res>
    extends _$TeamMemberModelCopyWithImpl<$Res, _$_TeamMemberModel>
    implements _$$_TeamMemberModelCopyWith<$Res> {
  __$$_TeamMemberModelCopyWithImpl(
      _$_TeamMemberModel _value, $Res Function(_$_TeamMemberModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? role = null,
    Object? bio = null,
    Object? links = null,
  }) {
    return _then(_$_TeamMemberModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      links: null == links
          ? _value._links
          : links // ignore: cast_nullable_to_non_nullable
              as List<SocialLink>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TeamMemberModel implements _TeamMemberModel {
  const _$_TeamMemberModel(
      {required this.name,
      required this.role,
      required this.bio,
      required final List<SocialLink> links})
      : _links = links;

  factory _$_TeamMemberModel.fromJson(Map<String, dynamic> json) =>
      _$$_TeamMemberModelFromJson(json);

  @override
  final String name;
  @override
  final String role;
  @override
  final String bio;
  final List<SocialLink> _links;
  @override
  List<SocialLink> get links {
    if (_links is EqualUnmodifiableListView) return _links;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_links);
  }

  @override
  String toString() {
    return 'TeamMemberModel(name: $name, role: $role, bio: $bio, links: $links)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TeamMemberModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            const DeepCollectionEquality().equals(other._links, _links));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, role, bio,
      const DeepCollectionEquality().hash(_links));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TeamMemberModelCopyWith<_$_TeamMemberModel> get copyWith =>
      __$$_TeamMemberModelCopyWithImpl<_$_TeamMemberModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TeamMemberModelToJson(
      this,
    );
  }
}

abstract class _TeamMemberModel implements TeamMemberModel {
  const factory _TeamMemberModel(
      {required final String name,
      required final String role,
      required final String bio,
      required final List<SocialLink> links}) = _$_TeamMemberModel;

  factory _TeamMemberModel.fromJson(Map<String, dynamic> json) =
      _$_TeamMemberModel.fromJson;

  @override
  String get name;
  @override
  String get role;
  @override
  String get bio;
  @override
  List<SocialLink> get links;
  @override
  @JsonKey(ignore: true)
  _$$_TeamMemberModelCopyWith<_$_TeamMemberModel> get copyWith =>
      throw _privateConstructorUsedError;
}
