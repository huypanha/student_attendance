import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bouncing_widgets/custom_bounce_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:student_attendance/features/courses/models/course_model.dart';
import 'package:student_attendance/features/courses/views/create_edit_course.dart';
import 'package:student_attendance/features/courses/views/view_course_details.dart';
import 'package:student_attendance/features/users/models/user_model.dart';

import '../../../utils/style.dart';

class CoursesView extends StatefulWidget {
  const CoursesView({super.key});

  static String routeName = "/courses";

  @override
  State<CoursesView> createState() => _CoursesViewState();
}

class _CoursesViewState extends State<CoursesView> {
  List<CourseModel> courses = [
    CourseModel(
      id: 1,
      subject: "Flutter",
      img: "https://w7.pngwing.com/pngs/67/315/png-transparent-flutter-hd-logo-thumbnail.png",
      teacher: UserModel(
        id: 1,
        firstName: "Huy",
        lastName: "Panha",
      ),
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam efficitur felis vitae lacus mattis suscipit. Cras sed tempus diam. Etiam sem massa, rutrum vitae sem malesuada, egestas congue nibh.",
    ),
    CourseModel(
      id: 1,
      subject: "Python",
      img: "https://banner2.cleanpng.com/20190623/yp/kisspng-python-computer-icons-programming-language-executa-1713885634631.webp",
      teacher: UserModel(
        id: 1,
        firstName: "Huy",
        lastName: "Panha",
      ),
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam efficitur felis vitae lacus mattis suscipit. Cras sed tempus diam. Etiam sem massa, rutrum vitae sem malesuada, egestas congue nibh.",
      students: [
        UserModel(
          id: 1,
          firstName: "Huy",
          lastName: "Samrech",
        ),
        UserModel(
          id: 2,
          firstName: "Om",
          lastName: "Chanpiseth",
        ),
        UserModel(
          id: 3,
          firstName: "Kong",
          lastName: "Leng",
        ),
        UserModel(
          id: 4,
          firstName: "Yuk",
          lastName: "Chhunlay",
        ),
        UserModel(
          id: 5,
          firstName: "Huy",
          lastName: "Samrech",
        ),
        UserModel(
          id: 6,
          firstName: "Om",
          lastName: "Chanpiseth",
        ),
        UserModel(
          id: 7,
          firstName: "Kong",
          lastName: "Leng",
        ),
        UserModel(
          id: 8,
          firstName: "Yuk",
          lastName: "Chhunlay",
        ),
        UserModel(
          id: 1,
          firstName: "Huy",
          lastName: "Samrech",
        ),
        UserModel(
          id: 2,
          firstName: "Om",
          lastName: "Chanpiseth",
        ),
        UserModel(
          id: 3,
          firstName: "Kong",
          lastName: "Leng",
        ),
        UserModel(
          id: 4,
          firstName: "Yuk",
          lastName: "Chhunlay",
        ),
        UserModel(
          id: 5,
          firstName: "Huy",
          lastName: "Samrech",
        ),
        UserModel(
          id: 6,
          firstName: "Om",
          lastName: "Chanpiseth",
        ),
        UserModel(
          id: 7,
          firstName: "Kong",
          lastName: "Leng",
        ),
        UserModel(
          id: 8,
          firstName: "Yuk",
          lastName: "Chhunlay",
        ),
      ],
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
      return CustomBounceWidget(
        scaleFactor: .3,
        isScrollable: true,
        onPressed: (){
          context.push(Uri(path: ViewCourseDetails.routeName, queryParameters: {"item": jsonEncode(courses[index].toJson())}).toString());
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
              Expanded(
                child: CachedNetworkImage(
                  imageUrl: courses[index].img!,
                  fit: BoxFit.contain,
                ),
              ),
              Text(courses[index].subject!, style: Style.txt16Bold,),
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
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
        title: Text("Courses", style: Style.txt20Bold,),
        actions: [
          IconButton(
            onPressed: (){
              context.push(CreateEditCourse.routeName);
            },
            icon: Icon(Icons.add_circle),
          ),
        ],
      ),
      body: _buildCourses,
    );
  }
}