import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bouncing_widgets/custom_bounce_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:student_attendance/features/courses/models/course_model.dart';
import 'package:student_attendance/features/students/views/view_student_details.dart';
import 'package:student_attendance/features/users/models/user_model.dart';
import 'package:student_attendance/utils/utils.dart';

class Students extends StatefulWidget {
  const Students({super.key});

  static String routeName = "/students";

  @override
  State<Students> createState() => _StudentsState();
}

class _StudentsState extends State<Students> {
  List<UserModel> datas = [
    UserModel(
      id: 1,
      firstName: "Huy",
      lastName: "Panha",
      email: "panha@test.com",
      type: UserType.student,
      stuId: "SS1001",
      phoneNumber: "0123456789",
      dob: DateTime.now(),
      courses: [
        CourseModel(
          id: 1,
          subject: "Flutter",
        ),
        CourseModel(
          id: 1,
          subject: "Python",
        ),
        CourseModel(
          id: 1,
          subject: "Linux",
        ),
        CourseModel(
          id: 1,
          subject: "JAVA",
        ),
      ],
      createdAt: DateTime.now(),
      lastActive: DateTime.now(),
    ),
    UserModel(
      id: 2,
      firstName: "Huy",
      lastName: "Samrech",
      email: "samrech@test.com",
      type: UserType.student,
      stuId: "SS1002",
      phoneNumber: "0123456789",
      dob: DateTime.now(),
      courses: [
        CourseModel(
          id: 1,
          subject: "Flutter",
        ),
        CourseModel(
          id: 1,
          subject: "Python",
        ),
      ],
      createdAt: DateTime.now(),
      lastActive: DateTime.now(),
    ),
    UserModel(
      id: 3,
      firstName: "Om",
      lastName: "Chanpiseth",
      email: "piseth@test.com",
      type: UserType.student,
      stuId: "SS1003",
      phoneNumber: "0123456789",
      dob: DateTime.now(),
      courses: [
        CourseModel(
          id: 1,
          subject: "Flutter",
        ),
        CourseModel(
          id: 1,
          subject: "Python",
        ),
      ],
      createdAt: DateTime.now(),
      lastActive: DateTime.now(),
    ),
    UserModel(
      id: 3,
      firstName: "Kong",
      lastName: "Leng",
      email: "leng@test.com",
      type: UserType.student,
      stuId: "SS1004",
      phoneNumber: "0123456789",
      dob: DateTime.now(),
      courses: [
        CourseModel(
          id: 1,
          subject: "Flutter",
        ),
        CourseModel(
          id: 1,
          subject: "Python",
        ),
      ],
      createdAt: DateTime.now(),
      lastActive: DateTime.now(),
    ),
    UserModel(
      id: 3,
      firstName: "Yourk",
      lastName: "Chhunlay",
      email: "chhunlay@test.com",
      type: UserType.student,
      stuId: "SS1005",
      phoneNumber: "0123456789",
      dob: DateTime.now(),
      courses: [],
      createdAt: DateTime.now(),
      lastActive: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
        elevation: 0,
        title: Text("Students", style: Style.txt20Bold,),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            _buildStudents,
          ],
        ),
      ),
    );
  }

  Widget get _buildStudents => ListView.builder(
    itemCount: datas.length,
    shrinkWrap: true,
    itemBuilder: (context, index) {
      var data = datas[index];

      return CustomBounceWidget(
        isScrollable: true,
        scaleFactor: .4,
        duration: const Duration(milliseconds: 200),
        onPressed: (){
          context.push(Uri(path: ViewStudentDetails.routeName, queryParameters: {"data": jsonEncode(data.toJson())}).toString());
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey[100]!,
            ),
            boxShadow: [
              Style.defaultShadow,
            ],
          ),
          margin: EdgeInsets.only(bottom: 10),
          child: ListTile(
            leading: data.avatar(),
            title: Text(data.fullName, style: Style.txt16,),
            subtitle: Text("${data.courses!.length} courses", style: Style.txt14Grey,),
            trailing: Icon(CupertinoIcons.chevron_right, color: Colors.grey[400],),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      );
    },
  );
}