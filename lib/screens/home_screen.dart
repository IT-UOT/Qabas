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

      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 24.0, left: 16, right: 16),
          child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (departments) => ListView.builder(
                  itemCount: departments.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final department = departments[index];
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            print('tapped');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.5,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                              child: Text(
                                department.name,
                                style: TextStyle(
                                  color: Colors.black
                                ),
                              ),
                            )
                          ),
                        ),
                        SizedBox(width: 12.0,),
                      ],
                    );
                  },
                ),
                orElse: () => Container(
                  child: Text('Loading or failed'),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}