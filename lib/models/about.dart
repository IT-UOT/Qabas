// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:itmentor/models/section.dart';
import 'package:itmentor/models/social_link.dart';
import 'package:itmentor/models/team_member.dart';
part 'about.freezed.dart';
part 'about.g.dart';

@freezed
class AboutModel with _$AboutModel {
  @JsonSerializable(explicitToJson: true)
  const factory AboutModel({
    required String id,
    required List<Section>? sections,
    required List<TeamMemberModel>? team,
    required List<SocialLink>? socialMedia,
  }) = _AboutModel;
  factory AboutModel.fromJson(Map<String, dynamic> json) =>
      _$AboutModelFromJson(json);
}
