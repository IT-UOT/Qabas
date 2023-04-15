import 'package:itmentor/models/department.dart';
import 'package:itmentor/services/api_service.dart';

class DepartmentRepository {
  final ApiService _apiService;

  DepartmentRepository(this._apiService);

  Future<List<DepartmentModel>> getDepartments() async {
    final jsonData = await _apiService.fetchDepartments();
    return jsonData.map((e) => DepartmentModel.fromJson(e)).toList();
  }
}