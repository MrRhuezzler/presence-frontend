import 'dart:convert';

import 'package:codekaine/components/common_layout.dart';
import 'package:codekaine/components/course_tile.dart';
import 'package:codekaine/components/text_container.dart';
import 'package:codekaine/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/Course.dart';

class StudentPage extends StatefulWidget {
  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  List<Course> courses = [];
  /*List<Course> courses = [
    Course(
      name: 'Stochastic processes',
      code: '20XT41',
      description: 'MSC TCS-2',
    ),
    Course(
      name: 'Optimization techniques',
      code: '20XT42',
      description: 'MSC TCS-2',
    ),
    Course(
      name: 'Computer networks',
      code: '20XT43',
      description: 'MSC TCS-2',
    ),
    Course(
      name: 'Operating systems',
      code: '20XT44',
      description: 'MSC TCS-3',
    ),
    Course(
      name: 'DATABASE DESIGN',
      code: '20XT45',
      description: 'MSC TCS-3',
    ),
  ];*/

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  void initPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    var response = await http.get(Uri.parse('$baseUrl/api/periods'));
    print(response.body);
    var periodJson = jsonDecode(response.body);
    List<Course> tempCourse = [];
    for (Map m in periodJson) {
      tempCourse = [
        ...tempCourse,
        Course(name: m['name'], code: m['code'], description: m['description'])
      ];
    }
    setState(() {
      courses = tempCourse;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // print(email);
    return CommonLayout(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.05, vertical: height * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextContainer(
                  width: width * 0.5,
                  // height:height*0.02,
                  text: 'Good Morning',
                  maxlines: 1,
                  presetFontSizes: [32, 30, 28, 26, 24, 22],
                  style: TextStyle(
                    color: Colors.grey[100],
                    fontWeight: FontWeight.w700,
                    // letterSpacing: 1.2,
                  ),
                ),
                InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.calendar_month,
                      color: primaryGreen,
                    )),
              ],
            ),
            SizedBox(height: height * 0.03),
            TextContainer(
              width: width * 0.4,
              // height:height*0.02,
              text: 'My Courses',
              maxlines: 1,
              presetFontSizes: [22, 20, 18, 16],
              style: TextStyle(
                color: primaryGreen,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: height * 0.02),
            Expanded(
              child: ListView(
                children: [
                  ...courses
                      .map((c) => CourseTile(course: c, isStudent: true))
                      .toList()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
