
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:itmentor/models/team_member.dart';
part 'about.freezed.dart';
part 'about.g.dart';
@freezed
class AboutModel with _$AboutModel{
  @JsonSerializable(explicitToJson: true)

  const factory AboutModel({
    required Map<String, String> sections,
    required List<TeamMemberModel> team,
    required Map<String, String> socialMedia,
  }) = _AboutModel;
  factory AboutModel.fromJson(Map<String, dynamic> json) => _$AboutModelFromJson(json);

}