import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itmentor/screens/error_screen.dart';
import 'package:itmentor/screens/widgets/loading_widget.dart';
import 'package:itmentor/screens/widgets/news_tile.dart';
import 'package:itmentor/services/locator.dart';

import '../blocs/news/news_cubit.dart';
import '../models/news.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => locator<NewsCubit>(),
        child: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            return SafeArea(
              child: state.when(
                initial: () => const LoadingWidget(),
                loading: () => const LoadingWidget(),
                loaded: (news) {
                  if (news.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('لا يوجد عناصر'),
                          FilledButton(
                              onPressed: () {
                             
                              },
                              child: const Text("إعادة المحاولة")),
                        ],
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: news.length,
                      itemBuilder: (context, index) {
                        return NewsTile(newsModel: news[index]);
                      },
                    );
                  }
                },
                error: (error) => ErrorScreen(message: error),
              ),
            );
          },
        ));
  }
}
