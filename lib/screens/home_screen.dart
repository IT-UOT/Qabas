import 'package:flutter/material.dart';


import '../services/locator.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 // final _departmentBloc = locator.get<DepartmentBloc>();
 // final _courseBloc = locator.get<CourseBloc>();

  @override
  void initState() {
    super.initState();
   // _departmentBloc.fetchDepartments();
  }

  @override
  void dispose() {
  //  _departmentBloc.dispose();
  //  _courseBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IT Mentor'),
      ),
   //   body: ,
    );
  }
}
