import 'package:flutter/material.dart';
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
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          color: Color(0xffD1DAE9),
          width: 2,
        ),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      collapsedShape: const RoundedRectangleBorder(
        side: BorderSide(
          color: Color(0xffD1DAE9),
          width: 2,
        ),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      title: Text(
        course.name,
        style: const TextStyle(
            fontWeight: FontWeight.w500, fontSize: 12, color: Colors.black),
      ),
      subtitle: Text(course.courseCode,
          style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: Color(0xff898F9B))),
      children: course.links.entries
          .map((e) => Column(
                children: [
                  ListTile(
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: Color(0xff898F9B),
                    ),
                    title: Text(e.key,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Color(0xff898F9B))),
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
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(),
                  ),

                  if (course.links.entries.last.key == e.key)
                    ListTile(
                      title: const Text(
                        "متطلبات المادة",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                      subtitle: Text(
                        course.requirements.join("\n"),
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(0xff898F9B)),
                      ),
                    ),
                  if (course.links.entries.last.key == e.key)
                    const SizedBox(
                      height: 16,
                    ),
                ],
              ))
          .toList(),
    );
  }
}
