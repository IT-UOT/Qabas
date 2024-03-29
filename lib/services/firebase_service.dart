import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:itmentor/models/news.dart';
import 'package:itmentor/services/locator.dart';
import 'package:uuid/uuid.dart';

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
          departments.add(
              DepartmentModel.fromJson(doc.data() as Map<String, dynamic>));
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

  Future<void> createPost(NewsModel news, List<File> images) async {
    // upload new news item to firebase firestore and storage
    try {
      // upload images to storage
      final imageUrls = await _uploadImages(images);

      // update news item with image URLs
      news = news.copyWith(images: imageUrls);
      await firestore.collection('news').doc(news.id).set(news.toJson());
    } catch (e) {
      locator<LoggingHelper>().error(e.toString());
      rethrow;
    }
  }

  Future<void> updatePost(NewsModel news, List<File> images) async {
    // update existing news item in firebase firestore and storage
    try {
      // upload images to storage
      final imageUrls = await _uploadImages(images);

      // update news item with image URLs
      news = news.copyWith(images: imageUrls);
      await firestore.collection('news').doc(news.id).update(news.toJson());
    } catch (e) {
      locator<LoggingHelper>().error(e.toString());
      rethrow;
    }
  }

  Future<List<String>> _uploadImages(List<File> images) async {
    final storage = FirebaseStorage.instance;
    final imageUrls = <String>[];

    for (final image in images) {
      final ref = storage.ref().child('images/${const Uuid().v4()}');
      final uploadTask = ref.putFile(image);
      final snapshot = await uploadTask.whenComplete(() {});
      final imageUrl = await snapshot.ref.getDownloadURL();
      imageUrls.add(imageUrl);
    }

    return imageUrls;
  }

  Future<void> deletePost(String postId) async {
    // delete existing news item from firebase firestore
    try {
      await firestore.collection('news').doc(postId).delete();
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
  Future<AboutModel?> fetchAbout() async {
    // fetch about from firebase firestore
    AboutModel? about;
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
      await firestore.collection('about').doc(about.id).set(about.toJson());
    } catch (e) {
      locator<LoggingHelper>().error(e.toString());
      rethrow;
    }
  }

     Future<void> updateAbout(AboutModel about) async {
    // update about in firebase firestore
    try {
      final docRef = firestore.collection('about').doc(about.id);
      await docRef.update(about.toJson());
    } catch (e) {
      locator<LoggingHelper>().error(e.toString());
      rethrow;
    }
  }

  Future<void> deleteAbout(AboutModel about) async {
    // delete about from firebase firestore
    try {
      final docRef = firestore.collection('about').doc(about.id);
      await docRef.delete();
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
