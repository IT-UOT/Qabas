import 'package:itmentor/models/department.dart';
import 'package:itmentor/services/api_service.dart';
import 'package:itmentor/services/fake_data_service.dart';

import '../services/firebase_service.dart';

class DepartmentRepository {
  //final FakeDataService _apiService;
  final FirebaseService _firebaseService;


  DepartmentRepository(this._firebaseService);

  Future<List<DepartmentModel>> getDepartments() async {
    final res = await _firebaseService.fetchData().onError((error, stackTrace) {
      throw error.toString();
    });
    return res;
  }
}