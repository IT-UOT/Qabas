
import 'package:freezed_annotation/freezed_annotation.dart';

import 'course.dart';

part 'department.g.dart';
part 'department.freezed.dart';
@freezed
class DepartmentModel with _$DepartmentModel {
const factory DepartmentModel({
    required String name,
    required List<CourseModel> courses,
    required String depMapImgSrc,
    required List<String> depRequirements,
  }) = _DepartmentModel;

factory DepartmentModel.fromJson(Map<String, dynamic> json)  => _$DepartmentModelFromJson(json);

}
