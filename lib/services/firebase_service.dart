import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/department.dart';
import '../models/course.dart';

class FirebaseService{

  // static FirebaseService _instance;
  // static FirebaseService get instance {
  //   if (_instance == null) {
  //     _instance = FirebaseService._init();
  //   }
  //   return _instance;
  // }

  // FirebaseService._init();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;



  Future<User?> signInAnonymously() async {
    final UserCredential userCredential = await _auth.signInAnonymously();
    return userCredential.user;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<List<DepartmentModel>> fetchData()async{
    List<DepartmentModel> departments = [];
    try{
      var snapshot = await _firestore.collection('Departments').get();
      var snapshot2 = await _firestore.collection('Departments').doc(snapshot.docs[0].id).collection("Courses").get();
      var arr = [];
      // for(int i=0; i<snapshot.docs.length; i++) {
      //   arr[i] = await _firestore.collection('Departments').doc(snapshot.docs[i].id).collection("Courses").get();
      // }
      int i = 0;
      snapshot.docs.forEach((element) async{
        arr.add(await _firestore.collection('Departments').doc(snapshot.docs[i].id).collection("Courses").get());
        i++;
      });

      snapshot.docs.forEach((element) async{
        var courses = await  _firestore.collection('Departments').doc(element.id).collection("Courses").get();

        departments.add(
            DepartmentModel(
              name: element.data()["name"],
              courses: courses.docs.map((element) => CourseModel(name: element.data()['name'], links: element.data()['links'])).toList(),
            )
        );
      });
       }catch (e){
      print(e);
      rethrow;
    }
    return departments;
  }


}