import 'package:freezed_annotation/freezed_annotation.dart';
part 'course.g.dart';

part 'course.freezed.dart';
//@JsonSerializable(explicitToJson: true)
@freezed
class CourseModel with _$CourseModel{

  const factory CourseModel({
    required String id,
    required String name,
    required String courseCode,
    required List<String> requirements,
    required Map<String, String> links,
  }) = _CourseModel;

  factory CourseModel.fromJson(Map<String, dynamic> json)  => _$CourseModelFromJson(json);

}