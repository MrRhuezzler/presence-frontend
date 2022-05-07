import 'package:codekaine/screens/login_page.dart';
import 'package:codekaine/screens/student/student_page.dart';
import 'package:codekaine/screens/teacher/teacher_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  Paint.enableDithering = true;
  /*runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );*/
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        theme:ThemeData(
          fontFamily: 'Roboto'
        ),
        // home: TeacherPage()
        // home:StudentPage()
        home:LoginPage(),
      );
  }
}
