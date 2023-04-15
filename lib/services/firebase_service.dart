import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/department.dart';

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

  // upload department
  Future<void> uploadDepartment(String departmentName) async {
    final user = _auth.currentUser;
    if (user == null) {
      throw Exception('User is null!');
    }
    final department = _firestore.collection('departments').doc();
    await department.set({
      'name': departmentName,
      'userId': user.uid,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  // fetch all departments as List<DepartmentModel>
  Future<List<DepartmentModel>> fetchDepartments() async {
    final user = _auth.currentUser;
    if (user == null) {
      throw Exception('User is null!');
    }
    final snapshot = await _firestore
        .collection('departments')
        .orderBy('createdAt', descending: true)
        .get();
    return snapshot.docs.map((e) => DepartmentModel.fromMap(e.data())).toList() as List<DepartmentModel>;
  }

}