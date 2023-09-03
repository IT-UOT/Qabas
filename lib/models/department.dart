
import 'package:freezed_annotation/freezed_annotation.dart';

import 'course.dart';

part 'department.g.dart';
part 'department.freezed.dart';

@freezed
class DepartmentModel with _$DepartmentModel {
const factory DepartmentModel({
    required String id,
    required String name,
    required List<String> courses,
    required String depMapImgSrc,
    required List<String> depRequirements,
    required String description,
    required String depCode,
    required DateTime createdAt,

  }) = _DepartmentModel;

factory DepartmentModel.fromJson(Map<String, dynamic> json)  => _$DepartmentModelFromJson(json);

}
