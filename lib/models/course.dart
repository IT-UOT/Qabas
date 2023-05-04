import 'package:freezed_annotation/freezed_annotation.dart';
part 'course.g.dart';

part 'course.freezed.dart';
//@JsonSerializable(explicitToJson: true)
@freezed
class CourseModel with _$CourseModel{

  const factory CourseModel({
    required String name,
    required String courseCode,
    required List<dynamic> requirements,
    required Map<dynamic, dynamic> links,
  }) = _CourseModel;

  factory CourseModel.fromJson(Map<String, Object> json)  => _$CourseModelFromJson(json);

}