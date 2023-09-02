// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AboutModel _$$_AboutModelFromJson(Map<String, dynamic> json) =>
    _$_AboutModel(
      sections: Map<String, String>.from(json['sections'] as Map),
      team: (json['team'] as List<dynamic>)
          .map((e) => TeamMemberModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      socialMedia: Map<String, String>.from(json['socialMedia'] as Map),
    );

Map<String, dynamic> _$$_AboutModelToJson(_$_AboutModel instance) =>
    <String, dynamic>{
      'sections': instance.sections,
      'team': instance.team.map((e) => e.toJson()).toList(),
      'socialMedia': instance.socialMedia,
    };
