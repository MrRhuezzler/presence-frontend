import 'package:codekaine/constants.dart';
import 'package:flutter/material.dart';

class CommonLayout extends StatelessWidget {
  Widget child;
  CommonLayout({required this.child});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
        height: height,
        width: width,
        color:Colors.black,
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(colors: [
        //       Color.fromARGB(255, 240, 236, 236),
        //   Color.fromARGB(255, 166, 210, 216),
          
          

        // ],
        // stops:[0.3,1],
        //  begin: Alignment.topLeft, end: Alignment.centerRight)),
        child: SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
                backgroundColor: Colors.transparent,
                body: child)));
  }
}
