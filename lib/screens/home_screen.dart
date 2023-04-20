import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itmentor/data/department_repository.dart';
import 'package:itmentor/services/locator.dart';
import '../blocs/home_screen_bloc/home_screen_cubit.dart';
import '../services/api_service.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // the cubit should be implemented by injectable so it can be general in the app
      create: (_) => HomeScreenCubit(locator<DepartmentRepository>()),

      child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
        builder: (context, state) {
          return state.maybeWhen(
            initial: (){
              context.read<HomeScreenCubit>().loadDepartments();
              return Container(
                child: Text('initial'),
              );
            },
            loaded: (departments) {
              print('departments');
              print(departments);
              for(int i=0; i<departments.length; i++) print('-----------');
              return DefaultTabController(
                length: departments.length,
                child: Scaffold(
                  appBar: AppBar(
                    bottom: TabBar(
                      tabs: [
                        for (var department in departments) Tab(text: department.name),
                      ],
                      //                        Tab(icon: Icon(Icons.directions_bike)),
                    ),
                  ),
                  body: TabBarView(
                    children: [
                      // for(var department in departments)
                      //   for(var course in department.courses) Text(course.name),
                      for (var department in departments) ListView.builder(
                        itemCount: department.courses.length,
                        itemBuilder: (context, index) {
                          return ExpansionTile(
                            title: Text(department.courses[index].name),
                            children: department.courses[index].links.entries.map((e) => ListTile(
                              title: Text(e.key),
                              onTap: () {
                                print(e.value);
                              },
                            )).toList(),
                          );
                        }
                      ),
                    ],
                  ),
                  //child: Text(departments.first.courses.first.links["tel"]),
                ),
              );
            },
            error: (e) => Container(
              child: Text(e),
            ),
            loading: () => Container(
              child: Text('Loading'),
            ),
            orElse: () => Container(
              child: Text('Failed'),
            ),
          );
        },
      ),
    );
  }
}
