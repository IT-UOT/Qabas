import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itmentor/blocs/news/news_cubit.dart';
import 'package:itmentor/services/locator.dart';

import '../../widgets/loading_widget.dart';
import '../dashboard_item.dart';

class NewsDashboard extends StatelessWidget {
  const NewsDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<NewsCubit>(),
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          return state.when(

            initial: () => const LoadingWidget(),
            loading: () => const LoadingWidget(),
            loaded: (data) => ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return DashboardItem(
                  title: data[index].title,
                  onTap: (){},
                  onDelete: () {},
                  onEdit: () {},
                  subtitle: data[index].content.substring(0, 100),
                );
              },
            ),
            error: (message) => ErrorWidget(message),
          );
        },
      )
    );
  }
}
