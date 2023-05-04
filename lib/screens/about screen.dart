import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton(
            onPressed: () {
            },
            child: const Text('اشريلي قهوة'),
          ),
          const SizedBox(height: 16),
          const Text("Arab X Ben Nouba")
        ],
      ),
    );
  }
}
