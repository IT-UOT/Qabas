import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itmentor/models/department.dart';
import 'package:itmentor/screens/widgets/course_widget.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../blocs/home_screen_bloc/home_screen_cubit.dart';
import '../data/department_repository.dart';
import '../services/locator.dart';
import 'error_screen.dart';

class DepartmentsScreen extends StatefulWidget {
  const DepartmentsScreen({Key? key,}) : super(key: key);

  @override
  State<DepartmentsScreen> createState() => _DepartmentsScreenState();
}

class _DepartmentsScreenState extends State<DepartmentsScreen> with SingleTickerProviderStateMixin{

  int currentTabIndex = 0;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // the cubit should be implemented by injectable so it can be general in the app
      create: (_) => HomeScreenCubit(locator<DepartmentRepository>()),

      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (departments) {
                  return DefaultTabController(
                    length: departments.length,
                    initialIndex: currentTabIndex,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ButtonsTabBar(
                            //controller: _tabController,
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
                              for (var department in departments)
                                Tab(
                                  text: department.name,
                                ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Expanded(
                            child: TabBarView(
                              //controller: _tabController,
                              physics: const BouncingScrollPhysics(),
                              children: [
                                for (var department in departments)
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 8,
                                          bottom: 8,
                                          left: 8,
                                        ),
                                        child: ListTile(
                                          shape: const RoundedRectangleBorder(
                                            side: BorderSide(
                                              color: Color(0xffD1DAE9),
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(12)),
                                          ),
                                          title: const Text(
                                            "خريطة القسم",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                                color: Colors.black),
                                          ),
                                          leading: Icon(
                                            Icons.map_outlined,
                                            color: Theme.of(context).colorScheme.primary,
                                          ),
                                          trailing: const Icon(
                                            Icons.arrow_forward_ios,
                                            color: Color(0xff898F9B),
                                            size: 12,
                                          ),
                                          onTap: () {
                                            Navigator.of(context).push(MaterialPageRoute(
                                                builder: (context) => Directionality(
                                                  textDirection: TextDirection.rtl,

                                                  child: Scaffold(
                                                    appBar: AppBar(),
                                                    body:   PhotoViewGallery(
                                                      scrollPhysics: const BouncingScrollPhysics(),

                                                      pageOptions: [
                                                        PhotoViewGalleryPageOptions(
                                                          imageProvider: NetworkImage(department.depMapImgSrc),
                                                          minScale: PhotoViewComputedScale.contained * 5,
                                                          maxScale: PhotoViewComputedScale.covered * 1,
                                                          errorBuilder:  (context, error, stackTrace) {
                                                            return const Center(child: Text("حدث خطأ أثناء تحميل الصورة"));
                                                          },

                                                        ),
                                                      ],
                                                      backgroundDecoration: BoxDecoration(
                                                        color: Theme.of(context).canvasColor,
                                                      ),

                                                    ),
                                                  ),
                                                )));
                                            print(department.depMapImgSrc);
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 8,
                                          bottom: 8,
                                          left: 8,
                                        ),
                                        child: ExpansionTile(
                                          leading:  Icon(
                                            Icons.folder_copy_outlined,
                                            color:  Theme.of(context).colorScheme.primary,
                                          ),
                                          shape: const RoundedRectangleBorder(
                                            side: BorderSide(
                                              color: Color(0xffD1DAE9),
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(12)),
                                          ),
                                          collapsedShape:
                                          const RoundedRectangleBorder(
                                            side: BorderSide(
                                              color: Color(0xffD1DAE9),
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(12)),
                                          ),
                                          title:const  Text(
                                            "متطلبات القسم",
                                            style:  TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                                color: Colors.black),
                                          ),
                                          children: department.depRequirements
                                              .map((e) => Column(
                                            children: [
                                              ListTile(
                                                title: Text(e,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        fontSize: 12,
                                                        color: Color(
                                                            0xff898F9B))),

                                              ),
                                              department.depRequirements.last!=
                                                  e
                                                  ? const Padding(
                                                padding: EdgeInsets
                                                    .symmetric(
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
                                      ),

                                      const SizedBox(
                                        height: 8,
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
                                        child: ListView.builder(
                                            itemCount: department.courses.length,
                                            physics: const BouncingScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 8,
                                                  bottom: 8,
                                                  left: 8,
                                                ),
                                                child: CourseWidget( course:  department.courses[index]),
                                              );
                                            }),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                loading: () => const Center(child:  CircularProgressIndicator()),
                error: (e) => ErrorScreen(message: e),
                orElse: () => const ErrorScreen(),
              );
            },
          ),
        ),
      ),
    );
  }
}
