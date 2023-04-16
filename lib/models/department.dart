


class DepartmentModel {
final String name;

DepartmentModel({required this.name});

//from json
factory DepartmentModel.fromJson(Map<String, dynamic> json) {
  return DepartmentModel(
    name: json['name'],
  );

}

// from map

factory DepartmentModel.fromMap(Map<String, dynamic> map) {
  return DepartmentModel(
    name: map['name'],
  );
}
}