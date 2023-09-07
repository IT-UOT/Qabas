import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:itmentor/blocs/about/about_cubit.dart';
import 'package:itmentor/screens/dashboard/dashboard_home.dart';
import 'package:itmentor/screens/widgets/loading_widget.dart';

import '../services/locator.dart';
import '../utilities/consts.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<AboutCubit>(),
      child: BlocBuilder<AboutCubit, AboutState>(
        builder: (context, state) {
          return SafeArea(
            child: state.when(
              initial: () => const LoadingWidget(),
              loading: () => const LoadingWidget(),
              loaded: (about) {
                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<AboutCubit>().fetchAbout();
                  },
                  child: SizedBox(
                    height: double.infinity,
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Consts.paddingMedium,
                        ),
                        child: about == null
                            ? const Center(
                                child: Text('لا يوجد بيانات'),
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ...about.sections
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
                                    children: [
                                      for (var link in about.socialMedia)
                                        Column(
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      Consts.paddingMedium),
                                              child: Divider(),
                                            ),
                                            ListTile(
                                              trailing: const Icon(
                                                Icons.link,
                                                size:
                                                    Consts.defaultIconSizeSmall,
                                                color: Color(0xff898F9B),
                                              ),
                                              title: Text(link.name,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium),
                                              onTap: () async {
                                                // launch url
                                                launchUrl(Uri.parse(link.url),
                                                    mode: LaunchMode
                                                        .externalApplication);
                                                //    : throw 'Could not launch $e.value';
                                              },
                                            ),
                                            if (about.socialMedia.last.name ==
                                                link.name)
                                              const SizedBox(
                                                height: Consts.paddingMedium,
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
                                  ...about.team
                                      .map((member) => Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: Consts
                                                            .paddingSmall),
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
                                                                  Uri.parse(
                                                                      link.url),
                                                                  mode: LaunchMode
                                                                      .externalApplication);
                                                              //    : throw 'Could not launch $e.value';
                                                            },
                                                          ),
                                                          if (member.links.last
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
                  ),
                );
              },
              error: (error) => ErrorWidget(error),
            ),
          );
        },
      ),
    );
  }
}

/*
ExpansionTile(
               shape:  RoundedRectangleBorder(
                 side: BorderSide(
                   color: Color(0xffD1DAE9),
                   width: 2,
                 ),
                 borderRadius: BorderRadius.all(Radius.circular(12)),
               ),
               collapsedShape:  RoundedRectangleBorder(
                 side: BorderSide(
                   color: Color(0xffD1DAE9),
                   width: 2,
                 ),
                 borderRadius: BorderRadius.all(Radius.circular(12)),
               ),
               title:  Text(
                 "Abdullah Arab",
                 style:  TextStyle(
                     fontWeight: FontWeight.w500, fontSize: 12, color: Colors.black),
               ),
               subtitle: Text("Mobile Developer",
                   style:  TextStyle(
                       fontWeight: FontWeight.w500,
                       fontSize: 12,
                       color: Color(0xff898F9B))),
               children:[],
             ),
 */
