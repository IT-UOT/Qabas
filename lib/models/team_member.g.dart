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
      links: (json['links'] as List<dynamic>)
          .map((e) => SocialLink.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TeamMemberModelToJson(_$_TeamMemberModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'role': instance.role,
      'bio': instance.bio,
      'links': instance.links,
    };
