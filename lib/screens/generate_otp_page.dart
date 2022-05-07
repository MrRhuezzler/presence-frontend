import 'dart:async';
import 'dart:math';

import 'package:codekaine/components/common_button.dart';
import 'package:codekaine/components/common_layout.dart';
import 'package:codekaine/components/generate_otp_button.dart';
import 'package:codekaine/components/text_container.dart';
import 'package:codekaine/constants.dart';
import 'package:codekaine/screens/attendance_report_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';

import '../components/student_card.dart';
import '../models/Course.dart';
import '../models/StudentAttendance.dart';

class GenerateOtpPage extends StatefulWidget {
  Course course;
  late List<StudentAttendance> attendance;
  
  GenerateOtpPage({required this.course}){
    attendance=course.students!.map((s)=>StudentAttendance(student: s)).toList();
  }

  @override
  State<GenerateOtpPage> createState() => _GenerateOtpPageState();
}

class _GenerateOtpPageState extends State<GenerateOtpPage> {
  late CountdownTimerController controller;

  
  bool otpGenerated = false;
  String otp = '000000';
  bool timerEnd = false;
  var rng = new Random();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    void onEnd() {
      Future.delayed(const Duration(milliseconds: 3000), () {
        setState(() {
          timerEnd = true;
        });
      });
    }

    void startTimer() {
      setState(() {
        int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 10;
        controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);
      });
    }

    return CommonLayout(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.05, vertical: height * 0.04),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextContainer(
              text: widget.course.code.toUpperCase(),
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
              text: widget.course.name.toUpperCase(),
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
              text: widget.course.description.toUpperCase(),
              presetFontSizes: [20, 18, 16, 14],
              width: width * 0.8,
              maxlines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            // SizedBox(height:),
            if (!otpGenerated)
              Column(
                children: [
                  SizedBox(height: height * 0.2),
                  TextContainer(
                    text: 'GENTERATE OTP',
                    presetFontSizes: [30, 28, 26, 24, 22],
                    width: width * 0.8,
                    maxlines: 1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: height * 0.05),
                  Center(
                      child: GenerateOtpButton(
                    height: 150,
                    width: 150,
                    buttonBackgroundColor: Color(0xFF3BF388),
                    glowColor: primaryGreen.withOpacity(0.5),
                    child: Center(
                      child: Icon(
                        Icons.fingerprint,
                        color: primaryBlack,
                        size: 75,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        print('clicked');
                        otpGenerated = true;
                        otp = (rng.nextInt(900000) + 100000).toString();

                        print(otp);
                      });
                      startTimer();
                    },
                  )),
                ],
              ),
            if (otpGenerated)
              Column(
                children: [
                  if (!timerEnd)
                    Column(
                      children: [
                        SizedBox(height: height * 0.04),
                        TextContainer(
                          text: otp,
                          presetFontSizes: [50, 48, 46],
                          width: width * 0.8,
                          maxlines: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: primaryGreen,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 10,
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        CountdownTimer(
                          controller: controller,
                          onEnd: onEnd,
                          widgetBuilder: (_, CurrentRemainingTime? time) {
                            if (time != null)
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.alarm,
                                    color: time.sec! > 10
                                        ? primaryGreen
                                        : Colors.redAccent,
                                    size: 40,
                                  ),
                                  SizedBox(width: width * 0.05),
                                  TextContainer(
                                    text:
                                        '00 : ${time.sec.toString().padLeft(2, '0')}',
                                    presetFontSizes: [40, 38, 36],
                                    style: TextStyle(
                                      color: time.sec! > 10
                                          ? Colors.white
                                          : Colors.redAccent,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 1.5,
                                    ),
                                  ),
                                ],
                              );
                            else
                              return TextContainer(
                                text: 'Time up!',
                                presetFontSizes: [40, 38, 36],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.5,
                                ),
                              );
                          },
                        ),
                        SizedBox(height: height * 0.02),
                      ],
                    ),
                  if (timerEnd)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: height * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                otpGenerated = false;
                                otp = '000000';
                                timerEnd = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(10)),
                              height: height * 0.05,
                              width: width * 0.4,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.redo,
                                  ),
                                  SizedBox(width: width * 0.01),
                                  TextContainer(
                                      text: 'RESEND',
                                      presetFontSizes: [20, 18, 16],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                      )
                                    ),
                                ],
                              ),
                            ),
                          ),
                          CommonButton(
                              height: height * 0.05,
                              width: width * 0.45,
                              title: 'REPORT',
                              onTap: () {
                                Navigator.push((context),MaterialPageRoute(builder: (context)=>AttendanceReportPage(course: widget.course,attendance:widget.attendance)));
                              },

                              icon: Icon(
                                Icons.bar_chart,
                                color: primaryBlack,
                                size: height * 0.03,
                              )),
                        ],
                      ),
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
                        runSpacing: height*0.01,
                        alignment: WrapAlignment.spaceEvenly,
                        children: [
                          ...widget.attendance
                              .map((s) => StudentCard(student: s,onTap: (){setState(() {
                                
                              });},
                              absent: false,
                              ))
                              .toList()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
