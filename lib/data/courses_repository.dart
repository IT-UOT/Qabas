import 'package:itmentor/models/course.dart';

import '../services/firebase_service.dart';
import '../services/locator.dart';

class CoursesRepository {
  final FirebaseService _firebaseService = locator<FirebaseService>();

  Future<List<CourseModel>> getCourses() async {
    return await _firebaseService.fetchCourses();
  }

  Future<void> addCourse(CourseModel course) async {
    await _firebaseService.addCourse(course);
  }

  Future<void> updateCourse(CourseModel course) async {
    await _firebaseService.updateCourse(course);
  }

  Future<void> deleteCourse(CourseModel course) async {
    await _firebaseService.deleteCourse(course);
  }

  Future<void> addBulkCourses() async {
    await _firebaseService.addBulkCourses();
  }
}
