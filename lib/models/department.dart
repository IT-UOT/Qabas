
class DepartmentModel {
  final String name;

  DepartmentModel({required this.name});

  factory DepartmentModel.fromJson(Map<String, dynamic> json) {
    return DepartmentModel(name: json['name']);
  }
}