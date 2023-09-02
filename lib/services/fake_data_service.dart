

class FakeDataService{


  Future<List<Map<String, String>>> fetchDepartments() async{
    await Future.delayed( const Duration(seconds: 2));
    return [
      {"name": "Software Engineering"},
      {"name": "Mobile Computing"},
      {"name": "General Department"},
      {"name": "Web Technologies"},
      {"name": "Information Systems"},
      {"name": "Networks"},
    ];
  }

  Future<List<Map<String, String>>> fetchCourses() async{
    await Future.delayed( const Duration(seconds: 2));
    return [
      {"name": "Software Engineering"},
      {"name": "Mobile Computing"},
      {"name": "General Department"},
      {"name": "Web Technologies"},
      {"name": "Information Systems"},
      {"name": "Networks"},
    ];
  }


}