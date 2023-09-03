import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
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
          .then((QuerySnapshot querySnapshot) async {
        for (var doc in querySnapshot.docs) {
          locator<LoggingHelper>().debug(doc.data().runtimeType);
          departments.add(DepartmentModel.fromJson(
              doc.data() as Map<String, dynamic>));
        }
           });
    } catch (e) {
      locator<LoggingHelper>().error(e.toString());
      rethrow;
    }
    return departments;
  }

  Future<void> createDepartment(DepartmentModel department) async {
    try {
      await firestore
          .collection('departments')
          .doc(department.id)
          .set(department.toJson());
    } catch (e) {
      // handle error
      rethrow;
    }
  }

  Future<void> updateDepartment(DepartmentModel department) async {
    try {
      await firestore
          .collection('departments')
          .doc(department.id)
          .update(department.toJson());
    } catch (e) {
      // handle error
    }
  }

  Future<void> deleteDepartment(String departmentId) async {
    try {
      await firestore.collection('departments').doc(departmentId).delete();
    } catch (e) {
      // handle error
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
      await firestore
          .collection('courses')
          .doc(courseModel.id)
          .set(courseModel.toJson());
    } catch (e) {
      locator<LoggingHelper>().error(e.toString());
      rethrow;
    }
  }

  Future<void> updateCourse(CourseModel courseModel) async {
    // update a course
    try {
      await firestore
          .collection('courses')
          .doc(courseModel.id)
          .update(courseModel.toJson());
    } catch (e) {
      locator<LoggingHelper>().error(e.toString());
      rethrow;
    }
  }

  Future<void> deleteCourse(CourseModel courseModel) async {
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

  /// Bulk Courses

  Future<void> addBulkCourses() async {
    try {
      Map<String, dynamic> coursesJson =
          await loadJsonFromAssets('assets/json/subjects.json');
      var listOfCourses = coursesJson['subjects'] as List<dynamic>;
//      locator<LoggingHelper>().debug(listOfCourses);
      for (Map<String, dynamic> course in listOfCourses) {
        locator<LoggingHelper>().wtf("###################");
        //   locator<LoggingHelper>().debug(course);

        var c = CourseModel(
          courseCode: course['subject_code'],
          id: course['subject_code'],
          links: {},
          name: course['subject_name'],
          requirements: [],
        );
        addCourse(c);
      }
      locator<LoggingHelper>().wtf(listOfCourses.length);

      //   coursesJson.map((key, value) {
      //  var cours =   MapEntry(
      //         key,
      //         CourseModel(
      //           courseCode: value['subject_code'],
      //           id: value['subject_code'],
      //           links: {},
      //           name: value['subject_name'],
      //           requirements: [],
      //         ));
      //   locator<LoggingHelper>().debug(cours);

      //   });
    } catch (e) {
      locator<LoggingHelper>().error(e.toString());
      rethrow;
    }
  }

  Future<Map<String, dynamic>> loadJsonFromAssets(String filePath) async {
    String jsonString = await rootBundle.loadString(filePath);
    return jsonDecode(jsonString);
  }
}
