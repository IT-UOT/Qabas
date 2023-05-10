
import 'package:freezed_annotation/freezed_annotation.dart';
part 'team_member.freezed.dart';
part 'team_member.g.dart';
@freezed
class TeamMemberModel with _$TeamMemberModel{

  const factory TeamMemberModel({
    required String name,
    required String role,
    required String bio,
    required Map<String, String> links,
  }) = _TeamMemberModel;
  factory TeamMemberModel.fromJson(Map<String, dynamic> json) => _$TeamMemberModelFromJson(json);

}