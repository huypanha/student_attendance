import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bouncing_widgets/custom_bounce_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:student_attendance/features/courses/models/course_model.dart';
import 'package:student_attendance/features/courses/repos/course_repos.dart';
import 'package:student_attendance/features/courses/views/create_edit_course.dart';
import 'package:student_attendance/features/courses/views/view_course_details.dart';

import '../../../utils/utils.dart';

class CoursesView extends StatefulWidget {
  const CoursesView({super.key});

  static String routeName = "/courses";

  @override
  State<CoursesView> createState() => _CoursesViewState();
}

class _CoursesViewState extends State<CoursesView> {
  List<CourseModel> datas = [];
  bool isLoading = true;
  var refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    getCourses();
  }

  Future<bool> getCourses({bool refresh = false}) async {
    if(!refresh){
      isLoading = true;
      setState(() {});
    }

    var res = await CourseRepos().get({});
    if(res != null){
      datas = res;
    }

    if(!refresh){
      isLoading = false;
    }
    setState(() {});
    return res != null;
  }

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
            onPressed: () async {
              var re = await context.push(CreateEditCourse.routeName);
              if(re != null){
                refreshController.requestRefresh();
              }
            },
            icon: Icon(Icons.add_circle),
          ),
        ],
      ),
      body: isLoading ? loadingWidget() : SmartRefresher(
        controller: refreshController,
        enablePullDown: true,
        enablePullUp: true,
        header: ClassicHeader(),
        onRefresh: () async {
          datas.clear();
          var re = await getCourses(refresh: true);
          if(re){
            refreshController.refreshCompleted();
          } else {
            refreshController.refreshFailed();
          }
        },
        child: datas.isNotEmpty ? _buildCourses : notFoundWidget(),
      ),
    );
  }

  Widget get _buildCourses => GridView.builder(
    itemCount: datas.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      crossAxisCount: MediaQuery.sizeOf(context).width ~/ 200,
    ),
    padding: EdgeInsets.all(20),
    itemBuilder: (context, index) {
      return CustomBounceWidget(
        key: UniqueKey(),
        scaleFactor: .3,
        isScrollable: true,
        onPressed: () async {
          var re = await context.push(Uri(path: ViewCourseDetails.routeName, queryParameters: {"item": jsonEncode(datas[index].toJson())}).toString());
          if(re != null && re == true) {
            refreshController.requestRefresh();
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.grey[200]!,
            ),
            boxShadow: [
              Style.defaultShadow,
            ],
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    key: UniqueKey(),
                    imageUrl: datas[index].imgUrl,
                    fit: BoxFit.cover,
                    errorWidget: (_,__,___) => noImageWidget(),
                  ),
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(.1),
                        Colors.black.withOpacity(.5),
                      ],
                      stops: [0, .7, 1,],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.all(10),
                  child: Text(datas[index].subject!, style: Style.txt16WhiteBold,),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}