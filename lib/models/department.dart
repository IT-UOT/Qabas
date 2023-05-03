


import 'course.dart';

class DepartmentModel {
final String name;
final String depMapImgSrc;
final List<String> depRequirements;
final List<CourseModel> courses;

DepartmentModel({required this.name, required this.courses, required this.depMapImgSrc, required this.depRequirements });

//from json
factory DepartmentModel.fromJson(Map<dynamic, dynamic> json) {
  return DepartmentModel(
    name: json['name'],
    courses: json['courses'],
    depMapImgSrc: json['depMapImgSrc'],
    depRequirements: json['depRequirements'],
  );

}

// from map

factory DepartmentModel.fromMap(Map<dynamic, dynamic> map) {
  return DepartmentModel(
    name: map['name'],
    courses: map['courses'],
    depMapImgSrc: map['depMapImgSrc'],
    depRequirements: map['depRequirements'],
  );
}

// to map

Map<dynamic, dynamic> toMap() {
  return {
    'name': name,
    'courses': courses.map((e) => e.toMap()).toList(),
    'depMapImgSrc': depMapImgSrc,
    'depRequirements': depRequirements,
  };
}
}
