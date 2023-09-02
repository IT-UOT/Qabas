import 'package:flutter/material.dart';
import 'package:itmentor/screens/departments_screen.dart';
import 'package:itmentor/screens/news_screen.dart';
import 'package:itmentor/utilities/consts.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'about_screen.dart';
import 'dashboard/dashboard_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _tabs = const [
    DepartmentsScreen(),
    NewsScreen(),
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
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const DashboardHome()));
              },
              icon: const Icon(Icons.dashboard),
            ),
          ],
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
              label: 'الحوش',
            ),
            // NavigationDestination(
            //   icon: Icon(Icons.book_outlined),
            //   selectedIcon: Icon(Icons.book),
            //   label: 'المواد',
            // ),
            NavigationDestination(
              icon: Icon(Icons.article_outlined),
              selectedIcon: Icon(Icons.article),
              label: 'شن صاير؟',
            ),
            NavigationDestination(
              icon: Icon(Icons.info_outline),
              selectedIcon: Icon(Icons.info),
              label: 'مني انتو!',
            ),
          ],
        ),
        //bottomNavigationBar: ,
      ),
    );
  }
}
