import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itmentor/screens/dashboard/dashboard_item.dart';
import 'package:itmentor/screens/widgets/loading_widget.dart';
import 'package:itmentor/services/locator.dart';
import 'package:itmentor/utilities/consts.dart';

import '../../../blocs/departments/departments_cubit.dart';

class DepartmentsDashboard extends StatelessWidget {
  const DepartmentsDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => locator<DepartmentsCubit>(),
        child: BlocBuilder<DepartmentsCubit, DepartmentsState>(
          builder: (context, state) {
            return state.when(
              () => Container(),
              initial: () => const LoadingWidget(),
              loading: () => const LoadingWidget(),
              loaded: (data) => Stack(
                children: [
                  ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return DashboardItem(
                        title: data[index].name,
                        onTap: (){},
                        onDelete: () {},
                        onEdit: () {},
                     //   subtitle: data[index].name,
                      );
                    },
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: FloatingActionButton.extended(
                      heroTag:  'addDepartment',
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      label: const Text('إضافة قسم'),
                    ),
                  )
                ],
              ),
              error: (message) => ErrorWidget(message),
            );
          },
        ));
  }
}
