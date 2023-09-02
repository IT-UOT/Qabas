import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:itmentor/models/news.dart';
import 'package:itmentor/services/locator.dart';

import '../models/about.dart';
import '../models/department.dart';
import '../models/course.dart';
import 'logging_service.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseDatabase db = FirebaseDatabase.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  /// Authentication
  Future<User?> signInAnonymously() async {
    final UserCredential userCredential = await _auth.signInAnonymously();
    return userCredential.user;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  /// Departments
  Future<List<DepartmentModel>> fetchDepartments() async {
    List<DepartmentModel> departments = [];
    // fetch departments from firebase firestore
    try {
      await firestore
          .collection('departments')
          .get()
          .then((QuerySnapshot querySnapshot) async{
        for (var doc in querySnapshot.docs) {
          // locator<LoggingHelper>().debug(doc.data());
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          List<dynamic> coursesIDs = data['courses'];
          List<CourseModel> coursesList = [];
          List<dynamic> depRequirements = data["depRequirements"];
          // fetch courses for each department
          for (var courseID in coursesIDs) {
            await firestore
                .collection('courses')
                .doc(courseID)
                .get()
                .then((DocumentSnapshot documentSnapshot) {
              if (documentSnapshot.exists) {
                coursesList.add(
                  CourseModel.fromJson(
                      documentSnapshot.data() as Map<String, dynamic>),
                );
              }
            });
          }
          departments.add(
            DepartmentModel(
              name: data['name'],
              depMapImgSrc: data['depMapImgSrc'],
              depRequirements: depRequirements.map((e) => e.toString()).toList(),
              courses: coursesList,
            ),
          );
        }
      });
    } catch (e) {
      locator<LoggingHelper>().error(e.toString());
      rethrow;
    }
    return departments;
  }

  Future<void> uploadDepartment(DepartmentModel departmentModel) async {
    // upload department to firebase firestore
    try {
      await firestore.collection('departments').add(departmentModel.toJson());
    } catch (e) {
      locator<LoggingHelper>().error(e.toString());
      rethrow;
    }
  }

  /// Courses

  Future<List<CourseModel>> fetchCourses() async {
    // fetch all courses from firebase firestore
    List<CourseModel> courses = [];
    try {
      await firestore
          .collection('courses')
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          locator<LoggingHelper>().debug(doc.data().runtimeType);
          courses.add(CourseModel.fromJson(doc.data() as Map<String, dynamic>));
        }
      });
    } catch (e) {
      locator<LoggingHelper>().error(e.toString());
      rethrow;
    }
    return courses;
  }

  Future<void> addCourse(CourseModel courseModel) async {
    // upload a course
    try {
      await firestore.collection('courses').add(courseModel.toJson());
    } catch (e) {
      locator<LoggingHelper>().error(e.toString());
      rethrow;
    }

  }

  Future<void> updateCourse(CourseModel courseModel) async {
    // update a course
    try {
      await firestore.collection('courses').doc(courseModel.id).update(courseModel.toJson());
    } catch (e) {
      locator<LoggingHelper>().error(e.toString());
      rethrow;
    }
  }

  Future<void> deleteCourse(CourseModel courseModel) async {
    // delete a course
    try {
      await firestore.collection('courses').doc(courseModel.id).delete();
    } catch (e) {
      locator<LoggingHelper>().error(e.toString());
      rethrow;
    }
  }

  /// News
  Future<void> uploadNews(NewsModel news) async {
    // upload new news item to firebase firestore
    try {
      await firestore.collection('news').add(news.toJson());
    } catch (e) {
      locator<LoggingHelper>().error(e.toString());
      rethrow;
    }
  }

  Future<List<NewsModel>> fetchNews() async {
    // fetch all news from firebase firestore
    List<NewsModel> news = [];
    try {
      await firestore
          .collection('news')
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          locator<LoggingHelper>().debug(doc.data().runtimeType);
          news.add(NewsModel.fromJson(doc.data() as Map<String, dynamic>));
        }
      });
    } catch (e) {
      locator<LoggingHelper>().error(e.toString());
      rethrow;
    }
    return news;
  }

  /// About
  Future<AboutModel> fetchAbout() async {
    // fetch about from firebase firestore
    late AboutModel about;
    try {
      await firestore
          .collection('about')
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          about = AboutModel.fromJson(doc.data() as Map<String, dynamic>);
        }
      });
    } catch (e) {
      locator<LoggingHelper>().error(e.toString());
      rethrow;
    }
    return about;
  }

  Future<void> uploadAbout(AboutModel about) async {
    // upload about to firebase firestore
    try {
      await firestore.collection('about').add(about.toJson());
    } catch (e) {
      locator<LoggingHelper>().error(e.toString());
      rethrow;
    }
  }
}
