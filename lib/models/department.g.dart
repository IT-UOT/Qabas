// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DepartmentModel _$$_DepartmentModelFromJson(Map<String, dynamic> json) =>
    _$_DepartmentModel(
      name: json['name'] as String,
      courses: (json['courses'] as List<dynamic>)
          .map((e) => CourseModel.fromJson((e as Map<String, dynamic>).map(
                (k, e) => MapEntry(k, e as Object),
              )))
          .toList(),
      depMapImgSrc: json['depMapImgSrc'] as String,
      depRequirements: (json['depRequirements'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_DepartmentModelToJson(_$_DepartmentModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'courses': instance.courses,
      'depMapImgSrc': instance.depMapImgSrc,
      'depRequirements': instance.depRequirements,
    };
