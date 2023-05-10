import 'package:itmentor/models/department.dart';
import 'package:itmentor/services/locator.dart';

import '../services/firebase_service.dart';

class DepartmentRepository {
  //final FakeDataService _apiService;
  final FirebaseService _firebaseService = locator<FirebaseService>();
  List<DepartmentModel> departments = [];


 // DepartmentRepository(this._firebaseService);

  Future<List<DepartmentModel>> getDepartments() async {
    final res = await _firebaseService.fetchDepartments().onError((error, stackTrace) {
      throw error.toString();
    });
    departments = res;
    return departments;
  }
}