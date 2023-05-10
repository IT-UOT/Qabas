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
import '../utilities/consts.dart';
import 'error_screen.dart';
import 'widgets/loading_widget.dart';

class DepartmentsScreen extends StatefulWidget {
  const DepartmentsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DepartmentsScreen> createState() => _DepartmentsScreenState();
}

class _DepartmentsScreenState extends State<DepartmentsScreen>
    with SingleTickerProviderStateMixin {
  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // the cubit should be implemented by injectable so it can be general in the app
      create: (_) => locator<HomeScreenCubit>(),

      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
            builder: (context, state) {
              return state.when(
                      () => Container(),
                  initial: ()=> const LoadingWidget(),
                  loading: ()=> const LoadingWidget(),
                  loaded: (departments)=> DefaultTabController(
                    length: departments.length,
                    initialIndex: currentTabIndex,
                    child: Padding(
                      padding: const EdgeInsets.only( right: Consts.paddingMedium, top: Consts.paddingMedium),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ButtonsTabBar(
                            //controller: _tabController,
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            unselectedBackgroundColor: Colors.white,
                            labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
                            unselectedLabelStyle:Theme.of(context).textTheme.bodyMedium,
                            borderWidth: Consts.defaultBorderWidth,
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
                            height: Consts.paddingMedium,
                          ),
                          Expanded(
                            child: TabBarView(
                              //controller: _tabController,
                              //physics: const BouncingScrollPhysics(),
                              children: [
                                for (var department in departments)
                                  SingleChildScrollView(
                                //    physics: const BouncingScrollPhysics(),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: Consts.paddingSmall,
                                            bottom: Consts.paddingSmall,
                                            left: Consts.paddingLarge,
                                          ),
                                          child: Card(
                                            child: ListTile(

                                              title:  Text(
                                                "خريطة القسم",
                                                style: Theme.of(context).textTheme.titleMedium,
                                              ),
                                              leading: Icon(
                                                Icons.map_outlined,
                                                color: Theme.of(context).colorScheme.primary,
                                              ),
                                              trailing: const Icon(
                                                Icons.arrow_forward_ios,
                                                color: Color(0xff898F9B),
                                                size: Consts.defaultIconSizeSmall,
                                              ),
                                              onTap: () {
                                                Navigator.of(context).push(MaterialPageRoute(
                                                    builder: (context) => Directionality(
                                                      textDirection: TextDirection.rtl,

                                                      child: Scaffold(
                                                        appBar: AppBar(),
                                                        body:   PhotoViewGallery(
                                                          //scrollPhysics: const BouncingScrollPhysics(),

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
                                        ),
                                        const SizedBox(
                                          height: Consts.paddingSmall,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: Consts.paddingSmall,
                                            bottom: Consts.paddingSmall,
                                            left: Consts.paddingLarge,
                                          ),
                                          child: ExpansionTile(
                                            leading:  Icon(
                                              Icons.folder_copy_outlined,
                                              color:  Theme.of(context).colorScheme.primary,
                                              size: Consts.defaultIconSizeSmall,
                                            ),


                                            title:  Text(
                                              "متطلبات القسم",
                                              style:  Theme.of(context).textTheme.titleMedium,
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
                                                      horizontal: Consts.paddingMedium),
                                                  child: Divider(),
                                                )
                                                    : const SizedBox(
                                                  height: Consts.paddingSmall,
                                                ),

                                              ],
                                            ))
                                                .toList(),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: Consts.paddingSmall,
                                        ),
                                        Text(
                                          "المواد",
                                          style: Theme.of(context).textTheme.titleMedium,
                                        ),
                                        const SizedBox(
                                          height: Consts.paddingSmall,
                                        ),
                                        ...department.courses.map((e) =>  Padding(
                                          padding: const EdgeInsets.only(
                                            top: Consts.paddingSmall,
                                            bottom:Consts.paddingSmall,
                                            left: Consts.paddingLarge,
                                          ),
                                          child: CourseWidget( course:  e),
                                        )).toList(),

                                        // Expanded(
                                        //   child: ListView.builder(
                                        //       itemCount: department.courses.length,
                                        //       physics: const NeverScrollableScrollPhysics(),
                                        //       itemBuilder: (context, index) {
                                        //         return;
                                        //       }),
                                        // ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  error: (e) => ErrorScreen(message: e),
              );
            },
          ),
        ),
      ),
    );
  }
}
