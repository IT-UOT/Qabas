import 'package:itmentor/models/department.dart';
import 'package:itmentor/services/api_service.dart';
import 'package:itmentor/services/fake_data_service.dart';

class DepartmentRepository {
  final FakeDataService _apiService;


  DepartmentRepository(this._apiService);

  Future<List<DepartmentModel>> getDepartments() async {
    final jsonData = await _apiService.fetchDepartments();
    return jsonData.map((e) => DepartmentModel.fromJson(e)).toList();
  }
}