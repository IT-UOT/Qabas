import 'package:itmentor/models/department.dart';
import 'package:itmentor/services/firebase_service.dart';
import 'package:itmentor/services/locator.dart';

class DepartmentRepository {
  final FirebaseService _firebaseService = locator<FirebaseService>();
  List<DepartmentModel> departments = [];

  Future<List<DepartmentModel>> getDepartments() async {
    final res =
        await _firebaseService.fetchDepartments().onError((error, stackTrace) {
      throw error.toString();
    });
    departments = res;
    return departments;
  }

  Future<void> createDepartment(DepartmentModel department) async {
    try {
      await _firebaseService.createDepartment(department);
      departments.add(department);
    } catch (e) {
      // handle error
      rethrow;
    }
  }

  Future<void> updateDepartment(DepartmentModel department) async {
    try {
      await _firebaseService.updateDepartment(department);
      final index = departments.indexWhere((d) => d.id == department.id);
      departments[index] = department;
    } catch (e) {
      // handle error
      rethrow;
    }
  }

  Future<void> deleteDepartment(String departmentId) async {
    try {
      await _firebaseService.deleteDepartment(departmentId);
      departments.removeWhere((d) => d.id == departmentId);
    } catch (e) {
      // handle error
      rethrow;
    }
  }
}
