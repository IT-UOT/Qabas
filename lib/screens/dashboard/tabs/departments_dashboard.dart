import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itmentor/blocs/home_screen_bloc/home_screen_cubit.dart';
import 'package:itmentor/screens/dashboard/dashboard_item.dart';
import 'package:itmentor/screens/widgets/loading_widget.dart';
import 'package:itmentor/services/locator.dart';
import 'package:itmentor/utilities/consts.dart';

class DepartmentsDashboard extends StatelessWidget {
  const DepartmentsDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => locator<HomeScreenCubit>(),
        child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
          builder: (context, state) {
            return state.when(
              () => Container(),
              initial: () => const LoadingWidget(),
              loading: () => const LoadingWidget(),
              loaded: (data) => ListView.builder(
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
              error: (message) => ErrorWidget(message),
            );
          },
        ));
  }
}
