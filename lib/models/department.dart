


import 'course.dart';

class DepartmentModel {
final String name;
final List<CourseModel> courses;

DepartmentModel({required this.name, required this.courses});

//from json
factory DepartmentModel.fromJson(Map<String, dynamic> json) {
  return DepartmentModel(
    name: json['name'],
    courses: json['courses'], 
  );

}

// from map

factory DepartmentModel.fromMap(Map<String, dynamic> map) {
  return DepartmentModel(
    name: map['name'],
    courses: map['courses'],
  );
}
}