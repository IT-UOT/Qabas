import 'package:itmentor/models/department.dart';
import 'package:itmentor/services/api_service.dart';

class DepartmentRepository {
  // https://mocki.io/v1/528235ae-3fb9-4126-9740-208fdeba2d71
  static const _departmentsUrl = 'https://mocki.io/v1/aadee6d5-7ebe-4a85-88f9-869a2708a87f';
  final ApiService _apiService;

  DepartmentRepository(this._apiService);

  Future<List<DepartmentModel>> getDepartments() async {
    final jsonData = await _apiService.fetchData(_departmentsUrl, {});
    return jsonData.map((e) => DepartmentModel.fromJson(e)).toList();
  }
}