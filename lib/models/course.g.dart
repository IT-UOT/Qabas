// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CourseModel _$$_CourseModelFromJson(Map<String, dynamic> json) =>
    _$_CourseModel(
      id: json['id'] as String,
      name: json['name'] as String,
      courseCode: json['courseCode'] as String,
      requirements: json['requirements'] as List<dynamic>,
      links: json['links'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$_CourseModelToJson(_$_CourseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'courseCode': instance.courseCode,
      'requirements': instance.requirements,
      'links': instance.links,
    };
