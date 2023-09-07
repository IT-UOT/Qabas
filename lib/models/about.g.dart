// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AboutModel _$$_AboutModelFromJson(Map<String, dynamic> json) =>
    _$_AboutModel(
      id: json['id'] as String,
      sections: (json['sections'] as List<dynamic>)
          .map((e) => Section.fromJson(e as Map<String, dynamic>))
          .toList(),
      team: (json['team'] as List<dynamic>)
          .map((e) => TeamMemberModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      socialMedia: (json['socialMedia'] as List<dynamic>)
          .map((e) => SocialLink.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AboutModelToJson(_$_AboutModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sections': instance.sections.map((e) => e.toJson()).toList(),
      'team': instance.team.map((e) => e.toJson()).toList(),
      'socialMedia': instance.socialMedia.map((e) => e.toJson()).toList(),
    };
