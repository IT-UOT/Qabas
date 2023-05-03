import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itmentor/data/department_repository.dart';
import 'package:itmentor/services/locator.dart';
import 'package:url_launcher/url_launcher.dart';
import '../blocs/home_screen_bloc/home_screen_cubit.dart';
import '../models/department.dart';
import '../services/api_service.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({required this.departments});

  final List<DepartmentModel> departments;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        vsync: this,
        length: widget.departments.length,
        initialIndex: currentTabIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //
      //   title: const Text('IT Mentor'),
      //
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TabBar(
            //   controller:  _tabController,
            //   isScrollable: true,
            //   indicatorColor: Colors.transparent,
            //
            //   tabs:
            // ),
            //const SizedBox(height: 16,),
            ButtonsTabBar(
              controller: _tabController,
              backgroundColor: Theme.of(context).colorScheme.primary,
              unselectedBackgroundColor: Colors.white,
              labelStyle: const TextStyle(
                  fontFamily: 'Alexandria',
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
              unselectedLabelStyle: const TextStyle(
                  fontFamily: 'Alexandria',
                  fontSize: 12,
                  color: Color(0xff898F9B),
                  fontWeight: FontWeight.w500),
              borderWidth: 2,
              borderColor: Theme.of(context).colorScheme.primary,
              unselectedBorderColor: const Color(0xffD1DAE9),
              radius: 100,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              tabs: [
                for (var department in widget.departments)
                  Tab(
                    text: department.name,
                  ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "المواد",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 8,
            ),

            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: const BouncingScrollPhysics(),
                children: [
                  for (var department in widget.departments)
                    ListView.builder(
                        itemCount: department.courses.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                              bottom: 8,
                              left: 8,
                            ),
                            child: ExpansionTile(
                              shape: const RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Color(0xffD1DAE9),
                                  width: 2,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              collapsedShape: const RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Color(0xffD1DAE9),
                                  width: 2,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              title: Text(
                                department.courses[index].name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                              children: department.courses[index].links.entries
                                  .map((e) => Column(
                                        children: [
                                          ListTile(
                                            trailing: const Icon(
                                              Icons.arrow_forward_ios,
                                              size: 12,
                                              color: Color(0xff898F9B),
                                            ),
                                            title: Text(e.key,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16,
                                                    color: Color(0xff898F9B))),
                                            onTap: () async {
                                              // launch url
                                              launchUrl(Uri.parse(e.value),
                                                  mode: LaunchMode
                                                      .externalApplication);
                                              //    : throw 'Could not launch $e.value';
                                            },
                                          ),
                                          // check the last link to not add divider
                                          department.courses[index].links
                                                      .entries.last.key !=
                                                  e.key
                                              ? const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 16),
                                                  child: Divider(),
                                                )
                                              : const SizedBox(
                                                  height: 8,
                                                ),
                                        ],
                                      ))
                                  .toList(),
                            ),
                          );
                        }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
