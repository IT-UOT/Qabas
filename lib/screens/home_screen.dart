import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itmentor/data/department_repository.dart';
import 'package:itmentor/models/course.dart';
import 'package:itmentor/screens/departments_screen.dart';
import 'package:itmentor/screens/widgets/course_widget.dart';
import 'package:itmentor/services/locator.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:url_launcher/url_launcher.dart';
import '../blocs/home_screen_bloc/home_screen_cubit.dart';
import '../models/department.dart';
import '../services/api_service.dart';
import 'package:http/http.dart' as http;

import 'about screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
     {

  int _currentIndex = 0;
  final List<Widget> _tabs = const  [
    DepartmentsScreen(),
    //CoursesScreen(),
    AboutScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(

          title: const Text('مرشد الطالب'),
       //   centerTitle: false,

        ),
        body: _tabs[_currentIndex],
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedIndex: _currentIndex,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'الرئيسية',
            ),
            // NavigationDestination(
            //   icon: Icon(Icons.book_outlined),
            //   selectedIcon: Icon(Icons.book),
            //   label: 'المواد',
            // ),
            NavigationDestination(
              icon: Icon(Icons.info_outline),
              selectedIcon: Icon(Icons.info),
              label: 'حول التطبيق',
            ),
          ],

        ),
        //bottomNavigationBar: ,
      ),
    );
  }
}

