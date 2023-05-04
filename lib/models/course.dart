class CourseModel{
  final String name;
  final String courseCode;
  final List<dynamic> requirements;
  final Map<dynamic, dynamic> links;

  CourseModel({
    required this.name,
    required this.requirements,
    required this.links,
    required this.courseCode,
  });

  //from map
  factory CourseModel.fromMap(Map<dynamic, dynamic> map) {
    return CourseModel(
      name: map['name'],
      requirements: map['requirments'],
      links: map['links'],
      courseCode: map['courseCode'],
    );
  }

  // to map
  Map<dynamic, dynamic> toMap() {
    return {
      'name': name,
      'requirements': requirements,
      'links': links,
      'courseCode': courseCode,
    };
  }

}