import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:student_attendance/features/auth/views/login.dart';
import 'package:student_attendance/features/courses/models/course_model.dart';
import 'package:student_attendance/features/courses/views/courses.dart';
import 'package:student_attendance/features/courses/views/create_edit_course.dart';
import 'package:student_attendance/features/courses/views/view_course_details.dart';
import 'package:student_attendance/features/dashboard/views/dashboard.dart';
import 'package:student_attendance/features/reports/views/report_for_teacher.dart';
import 'package:student_attendance/features/schedules/views/schedules_view.dart';
import 'package:student_attendance/features/students/views/students.dart';
import 'package:student_attendance/features/students/views/view_student_details.dart';
import 'package:student_attendance/features/users/models/user_model.dart';

import '../../features/app/app.dart';
import '../../features/auth/views/register.dart';
import '../../features/students/views/edit_student.dart';

final router = GoRouter(
  initialLocation: SplashScreen.routeName,
  routes: [
    GoRoute(
      path: SplashScreen.routeName,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const SplashScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
      ),
    ),
    GoRoute(
      path: OnboardScreen.routeName,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const OnboardScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
      ),
    ),
    GoRoute(
      path: LoginPage.routeName,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const LoginPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
      ),
    ),
    GoRoute(
      path: Register.routeName,
      pageBuilder: (context, state) => CupertinoPage(
        child: const Register(),
      ),
    ),
    GoRoute(
      path: Dashboard.routeName,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const Dashboard(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
      ),
    ),
    GoRoute(
      path: CoursesView.routeName,
      pageBuilder: (context, state) => CupertinoPage(
        child: const CoursesView(),
      ),
    ),
    GoRoute(
      path: CreateEditCourse.routeName,
      pageBuilder: (context, state) => CupertinoPage(
        child: CreateEditCourse(data: state.uri.queryParameters['data'] != null ? CourseModel.fromJson(jsonDecode(state.uri.queryParameters['data']!)) : null,),
      ),
    ),
    GoRoute(
      path: ViewCourseDetails.routeName,
      pageBuilder: (context, state) => CupertinoPage(
        child: ViewCourseDetails(data: CourseModel.fromJson(jsonDecode(state.uri.queryParameters['item']!)),),
      ),
    ),
    GoRoute(
      path: ScheduleView.routeName,
      pageBuilder: (context, state) => CupertinoPage(
        child: const ScheduleView(),
      ),
    ),
    GoRoute(
      path: Students.routeName,
      pageBuilder: (context, state) => CupertinoPage(
        child: const Students(),
      ),
    ),
    GoRoute(
      path: ViewStudentDetails.routeName,
      pageBuilder: (context, state) => CupertinoPage(
        child: ViewStudentDetails(data: UserModel.fromJson(jsonDecode(state.uri.queryParameters['data']!)),),
      ),
    ),
    GoRoute(
      path: EditStudent.routeName,
      pageBuilder: (context, state) => CupertinoPage(
        child: EditStudent(data: UserModel.fromJson(jsonDecode(state.uri.queryParameters['data']!)),),
      ),
    ),
    GoRoute(
      path: ReportForTeacher.routeName,
      pageBuilder: (context, state) => CupertinoPage(
        child: const ReportForTeacher(),
      ),
    ),
  ],
);