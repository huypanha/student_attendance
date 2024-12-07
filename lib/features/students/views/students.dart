import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bouncing_widgets/custom_bounce_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:student_attendance/features/students/views/view_student_details.dart';
import 'package:student_attendance/features/users/models/user_model.dart';
import 'package:student_attendance/features/users/repos/user_repos.dart';
import 'package:student_attendance/utils/utils.dart';

class Students extends StatefulWidget {
  const Students({super.key});

  static String routeName = "/students";

  @override
  State<Students> createState() => _StudentsState();
}

class _StudentsState extends State<Students> {
  List<UserModel> datas = [];
  bool isLoading = true;
  RefreshController refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    initData();
  }

  Future<bool> initData() async {
    isLoading = true;
    setState(() {});

    var re = await UserRepos().get({
      "type": 1,
      "status": 'A'
    });

    if(re != null){
      print(re);
      datas = UserModel.fromJsonArray(re);
    }

    isLoading = false;
    setState(() {});
    return re != null;
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
        elevation: 0,
        title: Text("Students", style: Style.txt20Bold,),
      ),
      body: isLoading ? loadingWidget() : SmartRefresher(
        controller: refreshController,
        enablePullDown: true,
        enablePullUp: true,
        header: ClassicHeader(),
        onRefresh: () async {
          datas.clear();
          var re = await initData();
          if(re){
            refreshController.refreshCompleted();
          } else {
            refreshController.refreshFailed();
          }
        },
        child: datas.isNotEmpty ? _buildStudents : notFoundWidget(),
      ),
    );
  }

  Widget get _buildStudents => ListView.builder(
    itemCount: datas.length,
    padding: EdgeInsets.all(10),
    itemBuilder: (context, index) {
      var data = datas[index];

      return CustomBounceWidget(
        isScrollable: true,
        scaleFactor: .4,
        duration: const Duration(milliseconds: 200),
        onPressed: () async {
          var re = await context.push(Uri(path: ViewStudentDetails.routeName, queryParameters: {"data": jsonEncode(data.toJson())}).toString());
          if(re != null && re == true) {
            refreshController.requestRefresh();
          }
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