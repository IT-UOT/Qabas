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
                              onPressed: () {},
                              child: const Text("إعادة المحاولة")),
                        ],
                      ),
                    );
                  } else {
                    final pinnedNews = news.where((n) => n.isPinned).toList();
                    final unpinnedNews =
                        news.where((n) => !n.isPinned).toList();

                    return RefreshIndicator(
                      onRefresh: () async {
                        await context.read<NewsCubit>().loadNews();
                      },
                      child: ListView.builder(
                        itemCount: pinnedNews.length + unpinnedNews.length,
                        itemBuilder: (context, index) {
                          if (index < pinnedNews.length) {
                            return NewsTile(newsModel: pinnedNews[index]);
                          } else {
                            return NewsTile(
                                newsModel:
                                    unpinnedNews[index - pinnedNews.length]);
                          }
                        },
                      ),
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
