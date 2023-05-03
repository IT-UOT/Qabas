import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/department.dart';
import '../models/course.dart';

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


  Future<User?> signInAnonymously() async {
    final UserCredential userCredential = await _auth.signInAnonymously();
    return userCredential.user;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<List<DepartmentModel>> fetchData() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref().child('departments');

    List<DepartmentModel> departments = [];
    try {
        // fetch data from firebase database
        await ref.get().then((DataSnapshot snapshot) {

          Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
          values.forEach((key, values) {
            List<CourseModel> courses = [];
            values['courses'].forEach((course) {
              courses.add(CourseModel.fromMap(course));

            });
            List<String> depRequirements = [];
            values['depRequirements'].keys.forEach((depRequirement) {
              depRequirements.add(depRequirement);
            });


            departments.add(DepartmentModel(name: values['name'], courses: courses, depMapImgSrc: values['depMapImgSrc'], depRequirements: depRequirements));
          });
        });
       // print(departments);

    }
    catch (e) {
      print(e);
      rethrow;
    }
    return departments;
  }


  Future<void> addData(DepartmentModel departmentModel) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref().child('departments');


    try {

      await ref.push().set(departmentModel.toMap());

    }
    catch (e) {
      print(e);
      rethrow;
    }
  }


}