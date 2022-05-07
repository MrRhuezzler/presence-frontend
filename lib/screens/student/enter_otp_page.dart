import 'package:codekaine/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

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

class _EnterOtpPageState extends State<EnterOtpPage> with WidgetsBindingObserver{
   bool _isInForeground = true;
   bool switchDetected=false;
  @override
  void initState() {
    super.initState();
    disableCapture();
    WidgetsBinding.instance!.addObserver(this);
    
  }
  
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    _isInForeground = state == AppLifecycleState.resumed;
    print('hi');
    setState(() {
      switchDetected=true;
      _allow=true;
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    controller.dispose();
    super.dispose();
  }
  bool otpGenerated = true;
  bool _allow = false;
    int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;
  late CountdownTimerController controller=CountdownTimerController(endTime: endTime, onEnd: onEnd);
  void onEnd(){
    setState(() {
      _allow=true;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () {
        return Future.value(_allow);
      },
      child: CommonLayout(
        child: !switchDetected?Container(
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
                        height: height * 0.02,
                      ),
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
                      SizedBox(
                        height: height * 0.02,
                      ),
                      OtpTextField(
                        textStyle: TextStyle(color: Colors.white, fontSize: 25),
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
                                  content:
                                      Text('Code entered is $verificationCode'),
                                );
                              });
                        }, // end onSubmit
                      ),
                      SizedBox(height: height * 0.05),
                      CommonButton(
                        height: height * 0.05,
                        width: width * 0.5,
                        title: 'SUBMIT',
                        onTap: () {},
                      )
                    ],
                  ),
                if (!otpGenerated)
                  Column(
                    children: [
                      SizedBox(height: height * 0.1),
                      SpinKitSpinningLines(
                        color: primaryGreen,
                        size: height * 0.3,
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
            )):Container(
              height:height,
              width:width,
              padding: EdgeInsets.symmetric(horizontal: width*0.05),
              color:Colors.redAccent,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextContainer(
                    text: 'TAB SWITCH IS NOT ALLOWED',
                  presetFontSizes: [24,22,20],
                  width:width*0.9,
                  maxlines: 1,
                  style: TextStyle(
                    color:Colors.white,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(height:height*0.04),
                  Icon(
                    Icons.warning_amber,
                    size:height*0.1,
                    color:Colors.yellowAccent
                    ),
                    SizedBox(height:height*0.04),
                  TextContainer(
                    text: 'YOUR ACTION WILL BE REPORTED',
                  presetFontSizes: [22,20,18,16],
                  width:width*0.9,
                  maxlines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color:Colors.white,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                  ),
                )
                ],
              ),
            ),
      ),
    );
  }
  Future<void> disableCapture() async {
    //disable screenshots and record screen in current screen
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

}
