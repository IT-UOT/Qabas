// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'department.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DepartmentModel _$DepartmentModelFromJson(Map<String, dynamic> json) {
  return _DepartmentModel.fromJson(json);
}

/// @nodoc
mixin _$DepartmentModel {
  String get name => throw _privateConstructorUsedError;
  List<CourseModel> get courses => throw _privateConstructorUsedError;
  String get depMapImgSrc => throw _privateConstructorUsedError;
  List<String> get depRequirements => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DepartmentModelCopyWith<DepartmentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DepartmentModelCopyWith<$Res> {
  factory $DepartmentModelCopyWith(
          DepartmentModel value, $Res Function(DepartmentModel) then) =
      _$DepartmentModelCopyWithImpl<$Res, DepartmentModel>;
  @useResult
  $Res call(
      {String name,
      List<CourseModel> courses,
      String depMapImgSrc,
      List<String> depRequirements});
}

/// @nodoc
class _$DepartmentModelCopyWithImpl<$Res, $Val extends DepartmentModel>
    implements $DepartmentModelCopyWith<$Res> {
  _$DepartmentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? courses = null,
    Object? depMapImgSrc = null,
    Object? depRequirements = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      courses: null == courses
          ? _value.courses
          : courses // ignore: cast_nullable_to_non_nullable
              as List<CourseModel>,
      depMapImgSrc: null == depMapImgSrc
          ? _value.depMapImgSrc
          : depMapImgSrc // ignore: cast_nullable_to_non_nullable
              as String,
      depRequirements: null == depRequirements
          ? _value.depRequirements
          : depRequirements // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DepartmentModelCopyWith<$Res>
    implements $DepartmentModelCopyWith<$Res> {
  factory _$$_DepartmentModelCopyWith(
          _$_DepartmentModel value, $Res Function(_$_DepartmentModel) then) =
      __$$_DepartmentModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      List<CourseModel> courses,
      String depMapImgSrc,
      List<String> depRequirements});
}

/// @nodoc
class __$$_DepartmentModelCopyWithImpl<$Res>
    extends _$DepartmentModelCopyWithImpl<$Res, _$_DepartmentModel>
    implements _$$_DepartmentModelCopyWith<$Res> {
  __$$_DepartmentModelCopyWithImpl(
      _$_DepartmentModel _value, $Res Function(_$_DepartmentModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? courses = null,
    Object? depMapImgSrc = null,
    Object? depRequirements = null,
  }) {
    return _then(_$_DepartmentModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      courses: null == courses
          ? _value._courses
          : courses // ignore: cast_nullable_to_non_nullable
              as List<CourseModel>,
      depMapImgSrc: null == depMapImgSrc
          ? _value.depMapImgSrc
          : depMapImgSrc // ignore: cast_nullable_to_non_nullable
              as String,
      depRequirements: null == depRequirements
          ? _value._depRequirements
          : depRequirements // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DepartmentModel implements _DepartmentModel {
  const _$_DepartmentModel(
      {required this.name,
      required final List<CourseModel> courses,
      required this.depMapImgSrc,
      required final List<String> depRequirements})
      : _courses = courses,
        _depRequirements = depRequirements;

  factory _$_DepartmentModel.fromJson(Map<String, dynamic> json) =>
      _$$_DepartmentModelFromJson(json);

  @override
  final String name;
  final List<CourseModel> _courses;
  @override
  List<CourseModel> get courses {
    if (_courses is EqualUnmodifiableListView) return _courses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_courses);
  }

  @override
  final String depMapImgSrc;
  final List<String> _depRequirements;
  @override
  List<String> get depRequirements {
    if (_depRequirements is EqualUnmodifiableListView) return _depRequirements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_depRequirements);
  }

  @override
  String toString() {
    return 'DepartmentModel(name: $name, courses: $courses, depMapImgSrc: $depMapImgSrc, depRequirements: $depRequirements)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DepartmentModel &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._courses, _courses) &&
            (identical(other.depMapImgSrc, depMapImgSrc) ||
                other.depMapImgSrc == depMapImgSrc) &&
            const DeepCollectionEquality()
                .equals(other._depRequirements, _depRequirements));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      const DeepCollectionEquality().hash(_courses),
      depMapImgSrc,
      const DeepCollectionEquality().hash(_depRequirements));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DepartmentModelCopyWith<_$_DepartmentModel> get copyWith =>
      __$$_DepartmentModelCopyWithImpl<_$_DepartmentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DepartmentModelToJson(
      this,
    );
  }
}

abstract class _DepartmentModel implements DepartmentModel {
  const factory _DepartmentModel(
      {required final String name,
      required final List<CourseModel> courses,
      required final String depMapImgSrc,
      required final List<String> depRequirements}) = _$_DepartmentModel;

  factory _DepartmentModel.fromJson(Map<String, dynamic> json) =
      _$_DepartmentModel.fromJson;

  @override
  String get name;
  @override
  List<CourseModel> get courses;
  @override
  String get depMapImgSrc;
  @override
  List<String> get depRequirements;
  @override
  @JsonKey(ignore: true)
  _$$_DepartmentModelCopyWith<_$_DepartmentModel> get copyWith =>
      throw _privateConstructorUsedError;
}
