import 'package:codekaine/components/text_container.dart';
import 'package:codekaine/constants.dart';
import 'package:flutter/material.dart';

import '../models/Student.dart';
import '../models/StudentAttendance.dart';

class StudentCard extends StatefulWidget {
  StudentAttendance student;
  Function onTap;
  bool absent;
  StudentCard({required this.student,required this.onTap,required this.absent});

  @override
  State<StudentCard> createState() => _StudentCardState();
}

class _StudentCardState extends State<StudentCard> {
  @override
  Widget build(BuildContext context) {
    // print(student.name);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap:(){
        widget.onTap();
      },
      child: Container(
        height:height*0.1,
        width:width*0.3,
        child:Column(
          children: [
            Icon(
              Icons.person,
              size:height*0.06,
              color:widget.student.present?primaryGreen:!widget.absent?Colors.white:Colors.redAccent,
            ),
            
            TextContainer(
              text:widget.student.student.name.toUpperCase(),
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
              text:widget.student.student.rollNo.toUpperCase(),
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
      ),
    );
  }
}