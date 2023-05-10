import 'package:flutter/material.dart';
import 'package:itmentor/utilities/consts.dart';

class DashboardHome extends StatelessWidget {
  const DashboardHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("لوحة التحكم"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.exit_to_app),
            ),
          ],
        ),
        body: Container(),
        drawer: Drawer(
          child: SafeArea(
            child: Column(
              children: const [
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
