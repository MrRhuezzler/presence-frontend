import 'package:codekaine/components/common_layout.dart';
import 'package:flutter/material.dart';

import '../components/text_container.dart';
import '../models/Course.dart';

class AttendanceReportPage extends StatelessWidget {
  Course course;
  AttendanceReportPage({required this.course});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    return CommonLayout(
      child:Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05,vertical: height*0.04),
        child:Column(
          children: [
            TextContainer(
              text: course.code.toUpperCase(),
              presetFontSizes: [30, 28, 26, 24, 22],
              width: width * 0.9,
              maxlines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            TextContainer(
              text: course.name.toUpperCase(),
              presetFontSizes: [24, 22, 20, 18, 16],
              width: width * 0.8,
              maxlines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[100],
                fontWeight: FontWeight.w600,
              ),
            ),
            TextContainer(
              text: course.description.toUpperCase(),
              presetFontSizes: [20, 18, 16, 14],
              width: width * 0.8,
              maxlines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        )
      )
    );
  }
}