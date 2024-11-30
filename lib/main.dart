import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_attendance/utils/style.dart';

import 'configs/router/routers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Student Attendance Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Style.primaryColor,
        fontFamily: 'Kantumruy',
        useMaterial3: true,
      ),
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}