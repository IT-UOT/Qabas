import 'package:flutter/material.dart';
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

  final List<Widget> _tabs = [];
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
          child: Row(
            children: <Widget>[
              NavigationRail(
                selectedIndex: _selectedIndex,
                groupAlignment: groupAlignment,
                trailing: FloatingActionButton(
                  elevation: 0,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(Icons.exit_to_app),
                ),
                onDestinationSelected: (int index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                labelType: labelType,
                destinations: destinations,
              ),
              const VerticalDivider(thickness: 1, width: 1),
              const SizedBox(
                width: Consts.paddingSmall,
              ),
              // This is the main content.
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _titles[_selectedIndex],
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text('selectedIndex: $_selectedIndex'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
