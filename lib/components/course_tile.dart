import 'package:codekaine/components/common_button.dart';
import 'package:codekaine/components/text_container.dart';
import 'package:codekaine/constants.dart';
import 'package:codekaine/screens/student/enter_otp_page.dart';
import 'package:flutter/material.dart';

import '../models/Course.dart';
import '../screens/teacher/generate_otp_page.dart';

class CourseTile extends StatelessWidget {
  Course course;
  bool isStudent;
  CourseTile({required this.course,required this.isStudent});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(bottom: height*0.03),
      child: Container(
        height: height * 0.15,
        child: Stack(
          children: [
            Container(
              height:height*0.12,
              width: width*0.9,
              padding: EdgeInsets.symmetric(horizontal: width*0.04,vertical:height*0.01),
              decoration: BoxDecoration(
                  // color:Colors.transparent,
                  color: primaryBlack,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color:Colors.black,
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: Offset(0, 4), // changes position of shadow
                    ),
                  ]),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextContainer(
                    text: '${course.code} - ${course.name}'.toUpperCase(),
                    presetFontSizes: [24,22],
                    width:width*0.9,
                    // height:height*0.03,
                    maxlines: 1,
                    textAlign: TextAlign.center,
                    style:TextStyle(
                      fontWeight: FontWeight.w700,
                      color:Colors.white
                    ),
                  ),
                  SizedBox(height:height*0.01),
                  TextContainer(
                    text: course.description.toUpperCase(),
                    presetFontSizes: [18,16,14,12,10],
                    width:width*0.4,
                    maxlines: 1,
                    textAlign: TextAlign.center,
                    style:TextStyle(
                      
                      fontWeight: FontWeight.w500,
                      color:Colors.grey[600]
                    ),
                  ),
                  // SizedBox(height:height*0.02),
                ],
              ),
            ),
            Positioned(
              top:height*0.12-height*0.02,
              left:(width*0.9-width*0.9)/2,
              child:CommonButton(
                height: height*0.05, width: width*0.9, title: !isStudent?'TAKE ATTENDANCE':'GIVE ATTENDANCE',
                onTap: (){
                  Navigator.push((context),MaterialPageRoute(builder: (context)=>!isStudent?GenerateOtpPage(course:course):EnterOtpPage(course: course)));
                },
              ),
      
            ),
          ],
        ),
      ),
    );
  }
}
