import 'package:codekaine/components/common_button.dart';
import 'package:codekaine/components/common_layout.dart';
import 'package:codekaine/components/text_container.dart';
import 'package:codekaine/screens/teacher/teacher_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return CommonLayout(
      child: GestureDetector(
        onTap: (){
          FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
        },
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.05, vertical: height * 0.06),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextContainer(
                text: 'PRESENCE',
                presetFontSizes: [40, 38, 36],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: primaryGreen,
                    letterSpacing: 1.5,
                    fontFamily: 'Montserrat'),
              ),
              SizedBox(height: height * 0.05),
              SpinKitSpinningLines(color: primaryGreen, size: height*0.2),
              SizedBox(height:height*0.05),
              TextField(
                cursorColor: Colors.white,
                  controller: emailController,
                  keyboardAppearance: Brightness.dark,

                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    contentPadding:EdgeInsets.symmetric(horizontal:10,vertical:5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    fillColor: primaryBlack,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: primaryGreen, width: 1),
                    ),
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      color: Colors.grey,),
                    // suffixIcon: Icon(Icons.search, color: Color(0xFF1D1D1D)),
                  ),
                
              ),
              SizedBox(height:height*0.02),
              TextField(
                cursorColor: Colors.white,
                keyboardAppearance: Brightness.dark,
                  controller: passwordController,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    contentPadding:EdgeInsets.symmetric(horizontal:10,vertical:5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    fillColor: primaryBlack,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: primaryGreen, width: 1),
                    ),
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: Colors.grey,),
                    // suffixIcon: Icon(Icons.search, color: Color(0xFF1D1D1D)),
                  ),
                
              ),
              SizedBox(height: height * 0.03),
              CommonButton(height: height*0.05, width: width*0.5, title: 'LOGIN', onTap: (){
                Navigator.push((context),MaterialPageRoute(builder: (context)=>TeacherPage()));
              })
            ],
          ),
        ),
      ),
    );
  }
}
