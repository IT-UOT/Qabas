import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itmentor/blocs/courses/courses_cubit.dart';
import 'package:itmentor/screens/dashboard/dashboard_item.dart';
import 'package:itmentor/screens/widgets/loading_widget.dart';
import 'package:itmentor/services/locator.dart';

class CoursesDashboard extends StatelessWidget {
  const CoursesDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<CoursesCubit>(),
      child: BlocBuilder<CoursesCubit, CoursesState>(
        builder: (context, state) {
          return state.when(
            initial: () => const LoadingWidget(),
            loading: () => const LoadingWidget(),
            loaded: (data) => Stack(
              children: [
                ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return DashboardItem(
                      title:  data[index].name,
                      subtitle: data[index].courseCode,
                      onDelete: (){},
                      onEdit: (){},
                      onTap: (){},
                    );
                  },
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: FloatingActionButton.extended(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                    label: const Text('إضافة مقرر'),
                  ),
                )
              ],
            ),
            error: (message) => ErrorWidget(message),
          );
        },
      ),
    );
  }
}
