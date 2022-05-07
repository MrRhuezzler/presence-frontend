import 'package:codekaine/components/text_container.dart';
import 'package:flutter/material.dart';

import '../models/Student.dart';

class StudentCard extends StatelessWidget {
  Student student;
  StudentCard({required this.student});
  @override
  Widget build(BuildContext context) {
    // print(student.name);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height:height*0.1,
      width:width*0.3,
      child:Column(
        children: [
          Icon(
            Icons.person,
            size:height*0.06,
            color:Colors.white,
          ),
          
          TextContainer(
            text:student.name.toUpperCase(),
            presetFontSizes: [12,10,8],
            width:width*0.3,
            height:height*0.02,
            textAlign: TextAlign.center,
            maxlines: 1,
            style: TextStyle(
              color:Colors.grey[300],
              fontWeight: FontWeight.w500
            ),
          ),
          TextContainer(
            text:student.rollNo.toUpperCase(),
            presetFontSizes: [12,10,8],
            width:width*0.3,
            height:height*0.02,
            textAlign: TextAlign.center,
            maxlines: 1,
            style: TextStyle(
              color:Colors.grey[300],
              fontWeight: FontWeight.w500
            ),
          ),

        ],
      )
    );
  }
}