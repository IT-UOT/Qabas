// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TeamMemberModel _$$_TeamMemberModelFromJson(Map<String, dynamic> json) =>
    _$_TeamMemberModel(
      name: json['name'] as String,
      role: json['role'] as String,
      bio: json['bio'] as String,
      links: Map<String, String>.from(json['links'] as Map),
    );

Map<String, dynamic> _$$_TeamMemberModelToJson(_$_TeamMemberModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'role': instance.role,
      'bio': instance.bio,
      'links': instance.links,
    };
