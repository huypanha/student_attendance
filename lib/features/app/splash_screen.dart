import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:student_attendance/features/app/app.dart';

import '../../utils/utils.dart';
import '../auth/views/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static String routeName = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // cache app document directory path
      Singleton.instance.appDocPath = (await getApplicationDocumentsDirectory()).path;
      log(Singleton.instance.appDocPath);

      // check if first installed
      Hive.init(Singleton.instance.appDocPath);
      Singleton.instance.cacheDB = await Hive.openBox('cache');

      // Check if it is installed for the first time or not to show onboarding screen
      var isFirstInstalled = Singleton.instance.cacheDB?.get("first_installed");

      if(isFirstInstalled == null) {
        context.go(OnboardScreen.routeName);
        return;
      }

      // if not first installed, go to login page
      context.go(LoginPage.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset("assets/images/logo.png", width: 200,)),
    );
  }
}