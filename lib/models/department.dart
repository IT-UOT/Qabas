
import 'package:freezed_annotation/freezed_annotation.dart';

part 'department_model.freezed.dart';

@freezed
class DepartmentModel with _$DepartmentModel {
  final String name;

  const factory DepartmentModel({
    required String name,
  }) = _DepartmentModel;

  factory DepartmentModel.fromJson(Map<String, dynamic> json) => _$DepartmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$DepartmentModelToJson(this);

  factory DepartmentModel.fromMap(Map<String, dynamic> map) => DepartmentModel(
    name: map['name'],
  );

  Map<String, dynamic> toMap() => {
    'name': name,
  };

}