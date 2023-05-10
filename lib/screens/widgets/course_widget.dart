import 'package:flutter/material.dart';
import 'package:itmentor/utilities/consts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/course.dart';

class CourseWidget extends StatelessWidget {
  const CourseWidget({
    super.key,
    required this.course,
  });

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        course.name,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(course.courseCode,
          style: Theme.of(context).textTheme.bodyMedium),
      children: course.links.entries
          .map((e) => Column(
                children: [
                  ListTile(
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: Consts.defaultIconSizeSmall,
                      color: Color(0xff898F9B),
                    ),
                    title: Text(e.key,
                        style: Theme.of(context).textTheme.bodyMedium),
                    onTap: () async {
                      // launch url
                      launchUrl(Uri.parse(e.value),
                          mode: LaunchMode.externalApplication);
                      //    : throw 'Could not launch $e.value';
                    },
                  ),
                  // check the last link to not add divider
                  // course.links.entries.last.key != e.key
                  //     ?
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: Consts.paddingMedium),
                    child: Divider(),
                  ),

                  if (course.links.entries.last.key == e.key)
                    ListTile(
                      title:  Text(
                        "متطلبات المادة",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Text(
                        course.requirements.join("\n"),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  if (course.links.entries.last.key == e.key)
                    const SizedBox(
                      height: Consts.paddingMedium,
                    ),
                ],
              ))
          .toList(),
    );
  }
}
