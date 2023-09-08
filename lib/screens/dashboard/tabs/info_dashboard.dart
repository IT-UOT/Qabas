import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itmentor/blocs/about/about_cubit.dart';
import 'package:itmentor/models/about.dart';
import 'package:itmentor/screens/widgets/loading_widget.dart';
import 'package:itmentor/utilities/consts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../services/locator.dart';

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
                ? const Center(
                    child: Text('لا يوجد'),
                  )
                : SizedBox(
                    height: double.infinity,
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Consts.paddingMedium,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: about.sections == null
                              ? []
                              : [
                                  ...about.sections!
                                      .map((e) => Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                e.title,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium,
                                              ),
                                              const SizedBox(
                                                height: Consts.paddingSmall,
                                              ),
                                              Text(
                                                e.content,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                              ),
                                              const SizedBox(
                                                height: Consts.paddingLarge,
                                              )
                                            ],
                                          ))
                                      .toList(),
                                  const SizedBox(
                                    height: Consts.paddingSmall,
                                  ),
                                  ExpansionTile(
                                    title: Text(
                                      "روابط",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    children: about.socialMedia == null
                                        ? []
                                        : [
                                            for (var link in about.socialMedia!)
                                              Column(
                                                children: [
                                                  const Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: Consts
                                                                .paddingMedium),
                                                    child: Divider(),
                                                  ),
                                                  ListTile(
                                                    trailing: const Icon(
                                                      Icons.link,
                                                      size: Consts
                                                          .defaultIconSizeSmall,
                                                      color: Color(0xff898F9B),
                                                    ),
                                                    title: Text(link.name,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyMedium),
                                                    onTap: () async {
                                                      // launch url
                                                      launchUrl(
                                                          Uri.parse(link.url),
                                                          mode: LaunchMode
                                                              .externalApplication);
                                                      //    : throw 'Could not launch $e.value';
                                                    },
                                                  ),
                                                  if (about.socialMedia!.last
                                                          .name ==
                                                      link.name)
                                                    const SizedBox(
                                                      height:
                                                          Consts.paddingMedium,
                                                    ),
                                                ],
                                              )
                                          ],
                                  ),
                                  const SizedBox(
                                    height: Consts.paddingLarge * 2,
                                  ),
                                  Text(
                                    "الفريق",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  const SizedBox(
                                    height: Consts.paddingSmall,
                                  ),
                                  if (about.team != null)
                                    ...about.team!
                                        .map((member) => Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical:
                                                          Consts.paddingSmall),
                                                  child: ExpansionTile(
                                                    title: Text(
                                                      member.name,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleMedium,
                                                    ),
                                                    subtitle: Text(member.role,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyMedium),
                                                    children: [
                                                      for (var link
                                                          in member.links)
                                                        Column(
                                                          children: [
                                                            const Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          Consts
                                                                              .paddingMedium),
                                                              child: Divider(),
                                                            ),
                                                            ListTile(
                                                              trailing:
                                                                  const Icon(
                                                                Icons.link,
                                                                size: Consts
                                                                    .defaultIconSizeSmall,
                                                                color: Color(
                                                                    0xff898F9B),
                                                              ),
                                                              title: Text(
                                                                  link.name,
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .bodyMedium),
                                                              onTap: () async {
                                                                // launch url
                                                                launchUrl(
                                                                    Uri.parse(link
                                                                        .url),
                                                                    mode: LaunchMode
                                                                        .externalApplication);
                                                                //    : throw 'Could not launch $e.value';
                                                              },
                                                            ),
                                                            if (member
                                                                    .links
                                                                    .last
                                                                    .name ==
                                                                link.name)
                                                              const SizedBox(
                                                                height: Consts
                                                                    .paddingMedium,
                                                              ),
                                                          ],
                                                        )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ))
                                        .toList(),
                                ],
                        ),
                      ),
                    ),
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
