import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itmentor/blocs/about/about_cubit.dart';
import 'package:itmentor/blocs/news/news_cubit.dart';
import 'package:itmentor/models/about.dart';
import 'package:itmentor/screens/dashboard/dashboard_item.dart';
import 'package:itmentor/screens/dashboard/tabs/add_about_page.dart';
import 'package:itmentor/screens/widgets/loading_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../services/locator.dart';
import '../../../utilities/consts.dart';

class InfoDashboard extends StatelessWidget {
  const InfoDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AboutCubit, AboutState>(
      bloc: locator<AboutCubit>(),
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (about) {
            return about == null
                ? Center(
                    child: FilledButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const EditAboutScreen(
                                    about: AboutModel(
                                        id: '1',
                                        sections: [],
                                        team: [],
                                        socialMedia: []),
                                  )));
                        },
                        child: const Text('إضافة')),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ID: ${about.id}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Sections:',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: ListView.builder(
                          itemCount: about.sections.length,
                          itemBuilder: (context, index) {
                            final section = about.sections[index];
                            return ListTile(
                              title: Text(section.title),
                              subtitle: Text(section.content),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Team Members:',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: ListView.builder(
                          itemCount: about.team.length,
                          itemBuilder: (context, index) {
                            final teamMember = about.team[index];
                            return ListTile(
                              title: Text(teamMember.name),
                              subtitle: Text(teamMember.role),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Social Media Links:',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: ListView.builder(
                          itemCount: about.socialMedia.length,
                          itemBuilder: (context, index) {
                            final socialLink = about.socialMedia[index];
                            return ListTile(
                              title: Text(socialLink.name),
                              subtitle: Text(socialLink.url),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/edit_about');
                        },
                        child: const Text('Edit'),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          context.read<AboutCubit>().deleteAbout(
                                about,
                              );
                          Navigator.pop(context);
                        },
                        child: const Text('Delete'),
                      ),
                    ],
                  );
          },
          error: (message) {
            return ErrorWidget(message);
          },
          orElse: () {
            return const Center(child: LoadingWidget());
          },
        );
      },
    );
  }
}

