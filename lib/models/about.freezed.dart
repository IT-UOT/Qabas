// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'about.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AboutModel _$AboutModelFromJson(Map<String, dynamic> json) {
  return _AboutModel.fromJson(json);
}

/// @nodoc
mixin _$AboutModel {
  String get id => throw _privateConstructorUsedError;
  List<Section> get sections => throw _privateConstructorUsedError;
  List<TeamMemberModel> get team => throw _privateConstructorUsedError;
  List<SocialLink> get socialMedia => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AboutModelCopyWith<AboutModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AboutModelCopyWith<$Res> {
  factory $AboutModelCopyWith(
          AboutModel value, $Res Function(AboutModel) then) =
      _$AboutModelCopyWithImpl<$Res, AboutModel>;
  @useResult
  $Res call(
      {String id,
      List<Section> sections,
      List<TeamMemberModel> team,
      List<SocialLink> socialMedia});
}

/// @nodoc
class _$AboutModelCopyWithImpl<$Res, $Val extends AboutModel>
    implements $AboutModelCopyWith<$Res> {
  _$AboutModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sections = null,
    Object? team = null,
    Object? socialMedia = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sections: null == sections
          ? _value.sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<Section>,
      team: null == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as List<TeamMemberModel>,
      socialMedia: null == socialMedia
          ? _value.socialMedia
          : socialMedia // ignore: cast_nullable_to_non_nullable
              as List<SocialLink>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AboutModelCopyWith<$Res>
    implements $AboutModelCopyWith<$Res> {
  factory _$$_AboutModelCopyWith(
          _$_AboutModel value, $Res Function(_$_AboutModel) then) =
      __$$_AboutModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      List<Section> sections,
      List<TeamMemberModel> team,
      List<SocialLink> socialMedia});
}

/// @nodoc
class __$$_AboutModelCopyWithImpl<$Res>
    extends _$AboutModelCopyWithImpl<$Res, _$_AboutModel>
    implements _$$_AboutModelCopyWith<$Res> {
  __$$_AboutModelCopyWithImpl(
      _$_AboutModel _value, $Res Function(_$_AboutModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sections = null,
    Object? team = null,
    Object? socialMedia = null,
  }) {
    return _then(_$_AboutModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sections: null == sections
          ? _value._sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<Section>,
      team: null == team
          ? _value._team
          : team // ignore: cast_nullable_to_non_nullable
              as List<TeamMemberModel>,
      socialMedia: null == socialMedia
          ? _value._socialMedia
          : socialMedia // ignore: cast_nullable_to_non_nullable
              as List<SocialLink>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_AboutModel implements _AboutModel {
  const _$_AboutModel(
      {required this.id,
      required final List<Section> sections,
      required final List<TeamMemberModel> team,
      required final List<SocialLink> socialMedia})
      : _sections = sections,
        _team = team,
        _socialMedia = socialMedia;

  factory _$_AboutModel.fromJson(Map<String, dynamic> json) =>
      _$$_AboutModelFromJson(json);

  @override
  final String id;
  final List<Section> _sections;
  @override
  List<Section> get sections {
    if (_sections is EqualUnmodifiableListView) return _sections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sections);
  }

  final List<TeamMemberModel> _team;
  @override
  List<TeamMemberModel> get team {
    if (_team is EqualUnmodifiableListView) return _team;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_team);
  }

  final List<SocialLink> _socialMedia;
  @override
  List<SocialLink> get socialMedia {
    if (_socialMedia is EqualUnmodifiableListView) return _socialMedia;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_socialMedia);
  }

  @override
  String toString() {
    return 'AboutModel(id: $id, sections: $sections, team: $team, socialMedia: $socialMedia)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AboutModel &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._sections, _sections) &&
            const DeepCollectionEquality().equals(other._team, _team) &&
            const DeepCollectionEquality()
                .equals(other._socialMedia, _socialMedia));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_sections),
      const DeepCollectionEquality().hash(_team),
      const DeepCollectionEquality().hash(_socialMedia));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AboutModelCopyWith<_$_AboutModel> get copyWith =>
      __$$_AboutModelCopyWithImpl<_$_AboutModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AboutModelToJson(
      this,
    );
  }
}

abstract class _AboutModel implements AboutModel {
  const factory _AboutModel(
      {required final String id,
      required final List<Section> sections,
      required final List<TeamMemberModel> team,
      required final List<SocialLink> socialMedia}) = _$_AboutModel;

  factory _AboutModel.fromJson(Map<String, dynamic> json) =
      _$_AboutModel.fromJson;

  @override
  String get id;
  @override
  List<Section> get sections;
  @override
  List<TeamMemberModel> get team;
  @override
  List<SocialLink> get socialMedia;
  @override
  @JsonKey(ignore: true)
  _$$_AboutModelCopyWith<_$_AboutModel> get copyWith =>
      throw _privateConstructorUsedError;
}
