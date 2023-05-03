import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key,  this.message}) : super(key: key);
  final String? message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("!حدث خطأ ما\n$message",
       style:   TextStyle(
         fontSize: 20,
         fontWeight: FontWeight.bold,
         color: Colors.red.shade400,
       ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
