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

  Future<List<DepartmentModel>> fetchData()async{
    List<DepartmentModel> departments = [];
    try{
      var snapshot = await _firestore.collection('departments').get();
      departments = snapshot.docs.map((doc) => DepartmentModel.fromMap(doc.data())).toList();

    }catch (e){
      print(e);
      rethrow;
    }
    return departments;
  }


}