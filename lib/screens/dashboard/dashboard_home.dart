import 'package:flutter/material.dart';
import 'package:itmentor/screens/dashboard/tabs/courses_dashboard.dart';
import 'package:itmentor/screens/dashboard/tabs/departments_dashboard.dart';
import 'package:itmentor/screens/dashboard/tabs/info_dashboard.dart';
import 'package:itmentor/screens/dashboard/tabs/news_dashboard.dart';
import 'package:itmentor/utilities/consts.dart';

class DashboardHome extends StatefulWidget {
  const DashboardHome({Key? key}) : super(key: key);

  @override
  State<DashboardHome> createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashboardHome> {
  int _selectedIndex = 0;

  NavigationRailLabelType labelType = NavigationRailLabelType.all;

  double groupAlignment = -1.0;

  final destinations = const <NavigationRailDestination>[
    NavigationRailDestination(
      icon: Icon(Icons.description_outlined),
      selectedIcon: Icon(Icons.description),
      label: Text('المواد'),
    ),
    NavigationRailDestination(
      icon: Icon(Icons.description_outlined),
      selectedIcon: Icon(Icons.description),
      label: Text('الأقسام'),
    ),
    NavigationRailDestination(
      icon: Icon(Icons.description_outlined),
      selectedIcon: Icon(Icons.description),
      label: Text('الأخبار'),
    ),
    NavigationRailDestination(
      icon: Icon(Icons.description_outlined),
      selectedIcon: Icon(Icons.description),
      label: Text('معلومات'),
    ),
  ];

  final List<Widget> _tabs = const [
    CoursesDashboard(),
    DepartmentsDashboard(),
    NewsDashboard(),
    InfoDashboard(),
  ];
  final List<String> _titles = [
    'المواد',
    'الأقسام',
    'الأخبار',
    'معلومات',
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [

              Row(
                children: <Widget>[
                  NavigationRail(
                    selectedIndex: _selectedIndex,
                    groupAlignment: groupAlignment,

                    onDestinationSelected: (int index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    labelType: labelType,
                    destinations: destinations,
                  ),
                  const VerticalDivider(thickness: 1, width: 1),
                  // This is the main content.
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(Consts.paddingSmall),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            _titles[_selectedIndex],
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(
                            height: Consts.paddingMedium,
                          ),
                          Expanded(
                            child: _tabs[_selectedIndex],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                right: Consts.paddingMedium ,
                bottom: Consts.paddingMedium,
                child: FloatingActionButton(
                  elevation: 0,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(Icons.exit_to_app),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
