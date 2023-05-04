import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            // FilledButton(
            //   onPressed: () {
            //   },
            //   child: const Text('اشريلي قهوة'),
            // ),
            Text("المطورين"
                ,style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Color(0xff898F9B),
            ),
            ),
            SizedBox(height: 16,),
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
            SizedBox(height: 16,),
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
                 "Mohammed Ben Nouba",
                 style:  TextStyle(
                     fontWeight: FontWeight.w500, fontSize: 12, color: Colors.black),
               ),
               subtitle: Text("UIUX Designer",
                   style:  TextStyle(
                       fontWeight: FontWeight.w500,
                       fontSize: 12,
                       color: Color(0xff898F9B))),
               children:[],
             ),
          ],
        ),
      ),
    );
  }
}
