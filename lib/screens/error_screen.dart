import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key,  this.message}) : super(key: key);
  final String? message;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline_rounded,
            size: 100,
            color: Colors.red.shade400,
          ),
          const SizedBox(height: 16,),
          Text("!حدث خطأ ما",
           style:   TextStyle(
             fontSize: 20,
             fontWeight: FontWeight.bold,
             color: Colors.red.shade400,
           ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8,),
          Text(message ?? "الرجاء المحاولة لاحقاً",
            style:   const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.black38,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
