import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:itmentor/models/news.dart';
import 'package:itmentor/services/locator.dart';
import 'package:logger/logger.dart';

import '../models/department.dart';
import '../models/course.dart';
import 'logging_service.dart';

class FirebaseService {
  // static FirebaseService _instance;
  // static FirebaseService get instance {
  //   if (_instance == null) {
  //     _instance = FirebaseService._init();
  //   }
  //   return _instance;
  // }

  // FirebaseService._init();

  //final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseDatabase db = FirebaseDatabase.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<User?> signInAnonymously() async {
    final UserCredential userCredential = await _auth.signInAnonymously();
    return userCredential.user;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<List<DepartmentModel>> fetchDepartments() async {
    DatabaseReference ref = db.ref().child('departments');

    List<DepartmentModel> departments = [];
    try {
      // fetch data from firebase database
      await ref.get().then((DataSnapshot snapshot) {
        Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
        values.forEach((key, values) {
          List<CourseModel> courses = [];
          values['courses'].forEach((course) {
            var requirements = course['requirements'].keys.toList();
            // print(course['courseCode']);
            // course['requirements'].keys.toList().map((e) {
            //   print("######$e");
            //   requirements.add(e);
            // });
            //print(course['requirements'].keys.toList());
            courses.add(CourseModel(
                name: course['name'],
                requirements: requirements,
                links: course['links'],
                courseCode: course['courseCode'].toString()));
          });
          List<String> depRequirements = [];
          values['depRequirements'].keys.forEach((depRequirement) {
            depRequirements.add(depRequirement);
          });

          departments.add(DepartmentModel(
              name: values['name'],
              courses: courses,
              depMapImgSrc: values['depMapImgSrc'],
              depRequirements: depRequirements));
        });
      });
      // print(departments);
    } catch (e) {
      print(e);
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

  Future<void> uploadCourse(
      CourseModel courseModel, String departmentName) async {
    // upload a course to a specific department in firebase firestore
    try {
      await firestore.collection('departments').doc(departmentName).update({
        'courses': FieldValue.arrayUnion([courseModel.toJson()])
      });
    } catch (e) {
      locator<LoggingHelper>().error(e.toString());
      rethrow;
    }
  }

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
}
