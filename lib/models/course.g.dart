// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CourseModel _$$_CourseModelFromJson(Map<String, dynamic> json) =>
    _$_CourseModel(
      name: json['name'] as String,
      courseCode: json['courseCode'] as String,
      requirements: json['requirements'] as List<dynamic>,
      links: json['links'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$_CourseModelToJson(_$_CourseModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'courseCode': instance.courseCode,
      'requirements': instance.requirements,
      'links': instance.links,
    };
