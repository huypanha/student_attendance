import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:student_attendance/features/auth/login.dart';
import 'package:student_attendance/utils/style.dart';
import 'package:student_attendance/utils/widgets/buttons.dart';

import '../../utils/singleton.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  static String routeName = "/onboardScreen";

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  PageController pageController = PageController();
  List<String> images = [
    "assets/images/onboard_student_profile.png",
    "assets/images/onboard_admin_access.png",
    "assets/images/onboard_attendance_tracking.png",
    "assets/images/onboard_schedule.png",
  ];
  List<String> titles = [
    "Student Profile",
    "Administrator Access",
    "Attendance Tracking",
    "Schedule",
  ];
  List<String> contents = [
    "Student Information: Each student has a profile that includes their basic details like name, roll number, class, and contact information.",
    "Administrators have the highest level of access within the system, allowing them to manage users, view all attendance records, generate reports, and customize system settings.",
    "Teachers can mark student attendance in real-time using various methods, such as manual entry, barcode scanning, or RFID check-ins. This ensures accurate and timely record-keeping.",
    "Teachers can mark student attendance in real-time using various methods, such as manual entry, barcode scanning, or RFID check-ins. This ensures accurate and timely record-keeping.",
  ];
  bool isLastPage = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemCount: titles.length,
                  onPageChanged: (p) {
                    if(p == 3){
                      isLastPage = true;
                    } else {
                      isLastPage = false;
                    }
                    setState(() {});
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ConstrainedBox(
                                constraints: const BoxConstraints(
                                  maxWidth: 300,
                                  maxHeight: 300,
                                ),
                                child: AspectRatio(
                                  aspectRatio: 1.0,
                                  child: Image.asset(images[index], width: 200,),
                                ),
                              ),
                              const SizedBox(height: 50,),
                              Text(titles[index], style: Style.txt25Bold,),
                              const SizedBox(height: 20,),
                              Text(contents[index], style: Style.txt14Grey, textAlign: TextAlign.center,),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 30,),
              SmoothPageIndicator(
                controller: pageController,
                count: titles.length,
                effect: JumpingDotEffect(
                  dotColor: Colors.grey[300]!,
                ),
                onDotClicked: (i) async {
                  await pageController.animateToPage(i, duration: const Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
                },
              ),
              const SizedBox(height: 30,),
              Row(
                children: [
                  Expanded(
                    child: primaryElevatedButton(
                      onPressed: () async {
                        if(pageController.page == 3) {
                          // Save first installed state
                          Singleton.instance.cacheDB?.put("first_installed", true);

                          // Go to login page
                          context.go(LoginPage.routeName);
                          return;
                        }

                        await pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
                      },
                      child: Text(isLastPage ? "Get Started" : "Next", style: Style.txt16White,),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}