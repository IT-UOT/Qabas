// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DepartmentModel _$$_DepartmentModelFromJson(Map<String, dynamic> json) =>
    _$_DepartmentModel(
      id: json['id'] as String,
      name: json['name'] as String,
      courses:
          (json['courses'] as List<dynamic>).map((e) => e as String).toList(),
      depMapImgSrc: json['depMapImgSrc'] as String,
      depRequirements: (json['depRequirements'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      description: json['description'] as String,
      depCode: json['depCode'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_DepartmentModelToJson(_$_DepartmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'courses': instance.courses,
      'depMapImgSrc': instance.depMapImgSrc,
      'depRequirements': instance.depRequirements,
      'description': instance.description,
      'depCode': instance.depCode,
      'createdAt': instance.createdAt.toIso8601String(),
    };
