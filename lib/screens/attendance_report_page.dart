import 'package:codekaine/components/common_layout.dart';
import 'package:flutter/material.dart';

import '../components/student_card.dart';
import '../components/text_container.dart';
import '../constants.dart';
import '../models/Course.dart';

class AttendanceReportPage extends StatelessWidget {
  Course course;
  AttendanceReportPage({required this.course});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return CommonLayout(
        child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.05, vertical: height * 0.04),
            child: Column(
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
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  height: height * 0.1,
                  padding: EdgeInsets.symmetric(horizontal: width*0.05,vertical: height*0.005),
                  width: width,
                  decoration: BoxDecoration(
                      // color:primaryGreen,
                      gradient: LinearGradient(
                          colors: [Color(0xFF3BF388), Color(0xFF02BBB8)],
                          stops: [0.3, 1],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextContainer(
                            text: 'PRESENT',
                            presetFontSizes: [26,24,22],
                            width: width * 0.4,
                            height:height*0.04,
                            maxlines: 1,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextContainer(
                            text: '34',
                            presetFontSizes: [36,34,32],
                            width: width * 0.3,
                            height:height*0.05,
                            maxlines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Container(
                            height:height*0.8,
                            width:1,
                            color:Colors.black,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextContainer(
                            text: 'ABESENT',
                            presetFontSizes: [26,24,22],
                            width: width * 0.39,
                            height:height*0.04,
                            maxlines: 1,
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          
                          TextContainer(
                            text: '4',
                            presetFontSizes: [36,34,32],
                            width: width * 0.39,
                            height:height*0.05,
                            maxlines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                
                Container(
                  height: height * 0.5,
                  width: width,
                  padding: EdgeInsets.symmetric(vertical: height * 0.02),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: primaryBlack,
                  ),
                  child: SingleChildScrollView(
                    child: Wrap(
                      runSpacing: height * 0.01,
                      alignment: WrapAlignment.spaceEvenly,
                      children: [
                        ...course.students!
                            .map((s) => StudentCard(student: s))
                            .toList()
                      ],
                    ),
                  ),
                ),
                
              ],
            )));
  }
}
