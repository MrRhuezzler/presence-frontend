import 'package:codekaine/components/text_container.dart';
import 'package:codekaine/screens/teacher/generate_otp_page.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CommonButton extends StatelessWidget {
  double height;
  double width;
  String title;
  Function onTap;
  Icon? icon;
  CommonButton(
      {required this.height, required this.width, required this.title,required this.onTap,this.icon});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        onTap();
      },
      child: Container(
        padding: icon==null?EdgeInsets.symmetric(vertical: height * 0.15):EdgeInsets.zero,
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF3BF388).withAlpha(60),
                blurRadius: 6.0,
                spreadRadius: 2,
                offset: Offset(
                  0.0,
                  3.0,
                ),
              ),
            ],
            gradient: LinearGradient(
                colors: [Color(0xFF3BF388), Color(0xFF02BBB8)],
                stops: [0.3, 1],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: icon!=null?Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              icon!,
              Padding(
                padding: EdgeInsets.symmetric(vertical: height*0.2),
                child: TextContainer(
                  text: title,
                  presetFontSizes: [20, 18, 16, 14, 12],
                  // textAlign: TextAlign.left,
                  width: width * 0.6,
                  height: height * 0.6,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color:Colors.black87
                  ),
                ),
              ),
            ],
          ),
        ):TextContainer(
              text: title,
              presetFontSizes: [20, 18, 16, 14, 12],
              textAlign: TextAlign.center,
              width: width * 0.7,
              height: height * 0.7,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color:Colors.black87
              ),
            ),
      ),
    );
  }
}
