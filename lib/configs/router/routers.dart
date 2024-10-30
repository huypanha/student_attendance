import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:student_attendance/features/auth/login.dart';
import 'package:student_attendance/features/auth/register.dart';
import 'package:student_attendance/features/courses/views/courses.dart';
import 'package:student_attendance/features/dashboard/dashboard.dart';

import '../../features/app/app.dart';

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
  ],
);