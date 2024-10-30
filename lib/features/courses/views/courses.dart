import 'dart:async';

import 'package:bouncing_button/bouncing_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:student_attendance/utils/models/feature_model.dart';

import '../../../utils/style.dart';

class CoursesView extends StatefulWidget {
  const CoursesView({super.key});

  static String routeName = "/courses";

  @override
  State<CoursesView> createState() => _CoursesViewState();
}

class _CoursesViewState extends State<CoursesView> {
  List<FeatureModel> courses = [
    FeatureModel(
      title: "Flutter",
      icon: CachedNetworkImage(
        imageUrl: 'https://w7.pngwing.com/pngs/67/315/png-transparent-flutter-hd-logo-thumbnail.png',
        fit: BoxFit.contain,
      ),
      routeName: '/courses',
    ),
    FeatureModel(
      title: "Python",
      icon: CachedNetworkImage(
        imageUrl: 'https://banner2.cleanpng.com/20190623/yp/kisspng-python-computer-icons-programming-language-executa-1713885634631.webp',
        fit: BoxFit.contain,
      ),
      routeName: '/courses',
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  Widget get _buildCourses => GridView.builder(
    itemCount: courses.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      crossAxisCount: MediaQuery.sizeOf(context).width ~/ 200,
    ),
    padding: EdgeInsets.all(20),
    itemBuilder: (context, index) {
      return BouncingButton(
        scaleFactor: .3,
        onPressed: (){
          context.push(CoursesView.routeName);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey[200]!,
            ),
            boxShadow: [
              Style.defaultShadow,
            ],
          ),
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(child: courses[index].icon),
              Text(courses[index].title, style: Style.txt16Bold,),
            ],
          ),
        ),
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
        ),
        title: Text("Courses", style: Style.txt20Bold,),
        // actions: [
        //   IconButton(
        //     onPressed: (){
        //
        //     },
        //     icon: Icon(Icons.add_circle),
        //   ),
        // ],
      ),
      body: _buildCourses,
    );
  }
}