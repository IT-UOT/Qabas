class CourseModel{
  final String name;
  //final List<String> requirments;
  final Map<dynamic, dynamic> links;

  CourseModel({
    required this.name,
    //required this.requirments,
    required this.links,
  });

  //from map
  factory CourseModel.fromMap(Map<dynamic, dynamic> map) {
    return CourseModel(
      name: map['name'],
      //requirments: map['requirments'],
      links: map['links'],
    );
  }

  // to map
  Map<dynamic, dynamic> toMap() {
    return {
      'name': name,
      //'requirments': requirments,
      'links': links,
    };
  }

}