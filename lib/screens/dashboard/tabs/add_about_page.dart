import 'package:flutter/material.dart';
import 'package:itmentor/models/about.dart';
import 'package:itmentor/models/section.dart';
import 'package:itmentor/models/social_link.dart';
import 'package:itmentor/models/team_member.dart';
import 'package:itmentor/services/locator.dart';

import '../../../blocs/about/about_cubit.dart';

class EditAboutScreen extends StatefulWidget {
  final AboutModel about;

  const EditAboutScreen({Key? key, required this.about}) : super(key: key);

  @override
  _EditAboutScreenState createState() => _EditAboutScreenState();
}

class _EditAboutScreenState extends State<EditAboutScreen> {
  late final TextEditingController _sectionsController;
  late final TextEditingController _teamController;
  late final TextEditingController _socialMediaController;

  @override
  void initState() {
    super.initState();
    _sectionsController = TextEditingController(
      text: widget.about.sections
          .map((s) => '${s.title}:${s.content}')
          .join('\n'),
    );
    _teamController = TextEditingController(
      text: widget.about.team
          .map((t) =>
              '${t.name}:${t.role}:${t.bio}:${t.links.map((l) => '${l.name}:${l.url}').join(';')}')
          .join('\n'),
    );
    _socialMediaController = TextEditingController(
      text:
          widget.about.socialMedia.map((s) => '${s.name}:${s.url}').join('\n'),
    );
  }

  @override
  void dispose() {
    _sectionsController.dispose();
    _teamController.dispose();
    _socialMediaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit About'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sections:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: widget.about.sections.length,
                itemBuilder: (context, index) {
                  final section = widget.about.sections[index];
                  return TextField(
                    controller: TextEditingController(
                      text: '${section.title}:${section.content}',
                    ),
                    onChanged: (value) {
                      widget.about.sections[index] = Section(
                        title: value.split(':')[0],
                        content: value.split(':')[1],
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Team Members:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: widget.about.team.length,
                itemBuilder: (context, index) {
                  final teamMember = widget.about.team[index];
                  return Column(
                    children: [
                      TextField(
                        controller: TextEditingController(
                          text:
                              '${teamMember.name}:${teamMember.role}:${teamMember.bio}:${teamMember.links.map((l) => '${l.name}:${l.url}').join(';')}',
                        ),
                        onChanged: (value) {
                          final parts = value.split(':');
                          widget.about.team[index] = TeamMemberModel(
                            name: parts[0],
                            role: parts[1],
                            bio: parts[2],
                            links: parts[3]
                                .split(';')
                                .map((l) => l.split(':'))
                                .map((l) => SocialLink(name: l[0], url: l[1]))
                                .toList(),
                          );
                        },
                      ),
                      const SizedBox(height: 8),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Social Media Links:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: widget.about.socialMedia.length,
                itemBuilder: (context, index) {
                  final socialLink = widget.about.socialMedia[index];
                  return TextField(
                    controller: TextEditingController(
                      text: '${socialLink.name}:${socialLink.url}',
                    ),
                    onChanged: (value) {
                      final parts = value.split(':');
                      widget.about.socialMedia[index] =
                          SocialLink(name: parts[0], url: parts[1]);
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                locator<AboutCubit>().updateAbout(widget.about);
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
