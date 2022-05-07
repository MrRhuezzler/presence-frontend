import 'package:codekaine/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../components/common_button.dart';
import '../../components/common_layout.dart';
import '../../components/text_container.dart';
import '../../models/Course.dart';

class EnterOtpPage extends StatefulWidget {
  Course course;
  EnterOtpPage({required this.course});

  @override
  State<EnterOtpPage> createState() => _EnterOtpPageState();
}

class _EnterOtpPageState extends State<EnterOtpPage> {
  bool otpGenerated=false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return CommonLayout(
      child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.05, vertical: height * 0.04),
          child: Column(
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
              SizedBox(
                height: height * 0.04,
              ),
              if (otpGenerated)
              Column(
                children: [
                  TextContainer(
                    text: "ENTER OTP",
                    presetFontSizes: [30, 28, 26, 24, 22],
                    width: width * 0.9,
                    maxlines: 1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                height: height * 0.04,
              ),
              OtpTextField(

                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 25
                ),
                numberOfFields: 6,
                borderColor: primaryGreen,
                focusedBorderColor: primaryGreen,
                disabledBorderColor: primaryGreen,
                enabledBorderColor: primaryGreen,
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Verification Code"),
                          content: Text('Code entered is $verificationCode'),
                        );
                      });
                }, // end onSubmit
              ),
              SizedBox(height:height*0.05),
              CommonButton(height: height*0.05, width: width*0.5, title: 'SUBMIT', onTap: (){},)
                ],
              ),
              if (!otpGenerated) 
              Column(
                children: [
                  
                  SizedBox(height: height * 0.1),
                  SpinKitSpinningLines(
                    color: primaryGreen,
                    size:height*0.3,
                    ),
                    SizedBox(height: height * 0.1),
                  TextContainer(
                    text: "WAITING",
                    presetFontSizes: [30, 28, 26, 24, 22],
                    width: width * 0.7,
                    maxlines: 1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: primaryGreen,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              )
              

            ],
          )),
    );
  }
}
