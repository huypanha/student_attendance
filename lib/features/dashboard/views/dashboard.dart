import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bouncing_widgets/custom_bounce_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:student_attendance/features/attendances/models/attendance_model.dart';
import 'package:student_attendance/features/attendances/repos/attendance_repos.dart';
import 'package:student_attendance/features/auth/views/login.dart';
import 'package:student_attendance/features/courses/models/course_model.dart';
import 'package:student_attendance/features/courses/views/courses.dart';
import 'package:student_attendance/features/dashboard/repos/dashboard_repos.dart';
import 'package:student_attendance/features/reports/views/report_for_teacher.dart';
import 'package:student_attendance/features/schedules/views/schedules_view.dart';
import 'package:student_attendance/features/students/views/students.dart';
import 'package:student_attendance/features/users/models/user_model.dart';
import 'package:student_attendance/utils/utils.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key});

  static String routeName = "/dashboard";

  @override
  ConsumerState<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  late Timer timer;
  List<FeatureModel> options = [
    FeatureModel(
      title: "Courses",
      icon: Icon(Icons.class_rounded, color: Style.primaryColor, size: 70,),
      routeName: CoursesView.routeName,
    ),
    FeatureModel(
      title: "Schedule",
      icon: Icon(CupertinoIcons.calendar, color: Style.primaryColor, size: 70,),
      routeName: ScheduleView.routeName,
    ),
    FeatureModel(
      title: "Students",
      icon: ASIcon.solid(ASIconData.educationCap, color: Style.primaryColor, size: 70,),
      routeName: Students.routeName,
    ),
    FeatureModel(
      title: "Reports",
      icon: Icon(CupertinoIcons.graph_square_fill, color: Style.primaryColor, size: 70,),
      routeName: Singleton.instance.token.type == UserType.teacher ? ReportForTeacher.routeName : ReportForTeacher.routeName,
    ),
  ];
  bool isLoading = true;
  CourseModel? currentCourse;
  var refreshController = RefreshController();
  List<AttendanceModel> currentAttendances = [];

  @override
  void initState() {
    super.initState();
    Singleton.instance.rootContext = context;
    getData();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      timer = Timer.periodic(const Duration(seconds: 1), (_){
        setState(() {});
      });
    });
  }

  Future<bool> getData() async {
    isLoading = true;
    setState(() {});

    var res = await DashboardRepos().get({});
    if(res != null){
      currentCourse = res.course;
      currentAttendances = [...res.attendances ?? []];
    }

    isLoading = false;
    setState(() {});
    return res != null;
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  Future punch() async {
    if(currentCourse == null) return;

    AttendanceModel? newAtt;

    var checkIns = currentAttendances.where((e) => e.type == AttendanceType.checkIn);
    var checkOuts = currentAttendances.where((e) => e.type == AttendanceType.checkOut);
    if(checkIns.isNotEmpty && checkOuts.isNotEmpty) {
      showMessage(
        context: context,
        content: "You have already punched in and out",
        status: 2,
      );
    } else if(checkIns.isEmpty) {
      newAtt = AttendanceModel(
        courseId: currentCourse!.id,
        type: AttendanceType.checkIn,
        createdAt: DateTime.now(),
      );
    } else {
      newAtt = AttendanceModel(
        courseId: currentCourse!.id,
        type: AttendanceType.checkOut,
        createdAt: DateTime.now(),
      );
    }

    if(newAtt == null) return;

    showLoading(context);
    var res = await AttendanceRepos().create(newAtt.toJson());
    context.pop();

    if(res != null){
      currentAttendances.add(newAtt);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Singleton.instance.widgetRef ??= ref;

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: SmartRefresher(
        controller: refreshController,
        enablePullDown: true,
        header: MaterialClassicHeader(),
        onRefresh: () async {
          var re = await getData();
          if(re){
            refreshController.refreshCompleted();
          } else {
            refreshController.refreshFailed();
          }
        },
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _buildHeader,
            if(Singleton.instance.token.type == UserType.student)
            const SizedBox(height: 20,),
            if(Singleton.instance.token.type == UserType.student)
            _buildAttendance,
            const SizedBox(height: 20,),
            _buildExplore,
            const SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }

  Widget get _buildHeader => Stack(
    children: [
      Container(
        color: Style.primaryColor,
        height: MediaQuery.sizeOf(context).height * 0.3,
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).padding.top + 10, 20, 0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey[200]!,
                          ),
                        ),
                        child: ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: Singleton.instance.token.profilePath,
                            fit: BoxFit.cover,
                            errorWidget: (_,__,___) => noProfileWidget(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hello,", style: Style.txt18White,),
                          Text(Singleton.instance.token.fullName, style: Style.txt20Bold.copyWith(color: Colors.white),),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10,),
                IconButton(
                  onPressed: () async {
                    var confirm = await showConfirmDialog(
                      context: context,
                      content: "Are you sure you want to log out?",
                      confirmText: "Log out",
                      isDangerous: true,
                    );
                    if(!confirm) return;

                    Singleton.instance.widgetRef = null;
                    Singleton.instance.token = UserModel();
                    context.go(LoginPage.routeName);
                  },
                  tooltip: "Log Out",
                  icon: ASIcon.solid(ASIconData.logout, color: Colors.white,),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  Style.defaultShadow,
                ],
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(DateFormat("hh:mm:ss a").format(DateTime.now()), style: Style.txt30Bold,),
                  const SizedBox(height: 10,),
                  Text(DateFormat("EEEE, dd MMM yyyy").format(DateTime.now()), style: Style.txt18Grey,),
                  const SizedBox(height: 10,),
                  Divider(
                    color: Colors.grey[200],
                  ),
                  const SizedBox(height: 10,),
                  (){
                    if(Singleton.instance.token.type == UserType.student) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                clockInIcon(
                                  color: (){
                                    if(currentAttendances.where((e) => e.type == AttendanceType.checkIn).isNotEmpty){
                                      return Colors.green;
                                    } else {
                                      return Colors.grey[300];
                                    }
                                  }()
                                ),
                                const SizedBox(height: 10,),
                                Text("Clock In", style: Style.txt16Grey,),
                                const SizedBox(height: 5,),
                                Text((){
                                  if(currentAttendances.where((e) => e.type == AttendanceType.checkIn).isNotEmpty){
                                    return DateFormat("HH:mm").format(currentAttendances.where((e) => e.type == AttendanceType.checkIn).first.createdAt!);
                                  } else {
                                    return "--:--";
                                  }
                                }(), style: Style.txt16Grey,),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                clockOutIcon(
                                  color: (){
                                    if(currentAttendances.where((e) => e.type == AttendanceType.checkOut).isNotEmpty){
                                      return Colors.red;
                                    } else {
                                      return Colors.grey[300];
                                    }
                                  }()
                                ),
                                const SizedBox(height: 10,),
                                Text("Clock Out", style: Style.txt16Grey,),
                                const SizedBox(height: 5,),
                                Text((){
                                  if(currentAttendances.where((e) => e.type == AttendanceType.checkOut).isNotEmpty){
                                    return DateFormat("HH:mm").format(currentAttendances.where((e) => e.type == AttendanceType.checkOut).last.createdAt!);
                                  } else {
                                    return "--:--";
                                  }
                                }(), style: Style.txt16Grey,),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                clockCheckIcon(
                                  color: (){
                                    if(currentAttendances.isNotEmpty){
                                      var checkIns = currentAttendances.where((e) => e.type == AttendanceType.checkIn);
                                      var checkOuts = currentAttendances.where((e) => e.type == AttendanceType.checkOut);
                                      if(checkIns.isNotEmpty && checkOuts.isNotEmpty) {
                                        return Style.primaryColor;
                                      } else {
                                        return Colors.grey[300];
                                      }
                                    } else {
                                      return Colors.grey[300];
                                    }
                                  }()
                                ),
                                const SizedBox(height: 10,),
                                Text("Duration", style: Style.txt16Grey,),
                                const SizedBox(height: 5,),
                                Text((){
                                  if(currentAttendances.isNotEmpty){
                                    var checkIns = currentAttendances.where((e) => e.type == AttendanceType.checkIn);
                                    var checkOuts = currentAttendances.where((e) => e.type == AttendanceType.checkOut);
                                    if(checkIns.isNotEmpty && checkOuts.isNotEmpty) {
                                      var duration = checkOuts.last.createdAt!.difference(checkIns.first.createdAt!);
                                      return "${duration.inHours}h ${duration.inMinutes.remainder(60)}m";
                                    } else {
                                      return "--:--";
                                    }
                                  } else {
                                    return "--:--";
                                  }
                                }(), style: Style.txt16Grey,),
                              ],
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Text('\uf0c0', style: Style.txtFAS(size: 40, color: Colors.grey[400]),),
                                    Positioned(
                                      right: 0,
                                      bottom: 0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 2,
                                          ),
                                        ),
                                        padding: EdgeInsets.all(7),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10,),
                                Text("Present", style: Style.txt16Grey,),
                                const SizedBox(height: 5,),
                                Text("0", style: Style.txt16Grey,),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Text('\uf0c0', style: Style.txtFAS(size: 40, color: Colors.grey[400]),),
                                    Positioned(
                                      right: 0,
                                      bottom: 0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 2,
                                          ),
                                        ),
                                        padding: EdgeInsets.all(7),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10,),
                                Text("Absence", style: Style.txt16Grey,),
                                const SizedBox(height: 5,),
                                Text("0", style: Style.txt16Grey,),
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                  }(),
                  if(Singleton.instance.token.type == UserType.student)
                    const SizedBox(height: 30,),
                  if(Singleton.instance.token.type == UserType.student)
                    Center(
                      child: CustomBounceWidget(
                        onPressed: punch,
                        isScrollable: true,
                        scaleFactor: .5,
                        duration: const Duration(milliseconds: 200),
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Style.primaryColor,
                                Color(0xff00DAFF),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.greenAccent,
                                offset: const Offset(-3, 3),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ASIcon.solid(ASIconData.handMiddleFinger, size: 50, color: Colors.white,),
                              const SizedBox(height: 10,),
                              Text((){
                                if(currentAttendances.where((e) => e.type == AttendanceType.checkIn).isNotEmpty) {
                                  return "PUNCH OUT";
                                }
                                return "PUNCH IN";
                              }(), style: Style.txt18Bold.copyWith(color: Colors.white),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(height: 20,),
                  Text((){
                    if(currentCourse != null) {
                      return currentCourse!.subject!;
                    } else {
                      return "Enjoy your break time";
                    }
                  }(), style: Style.txt16Grey,),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );

  Widget get _buildAttendance => Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        Style.defaultShadow,
      ],
    ),
    padding: EdgeInsets.all(20),
    margin: EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("Attendance", style: Style.txt25Bold,),
        const SizedBox(height: 20,),
        Row(
          children: [
            Expanded(
              child: attendanceBox(
                attendance: 0,
                title: "Total",
                color: Style.primaryColor,
              ),
            ),
            const SizedBox(width: 10,),
            Expanded(
              child: attendanceBox(
                attendance: 0,
                title: "Clock In",
                color: Colors.green,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10,),
        Row(
          children: [
            Expanded(
              child: attendanceBox(
                attendance: 0,
                title: "Late In",
                color: Colors.orange,
              ),
            ),
            const SizedBox(width: 10,),
            Expanded(
              child: attendanceBox(
                attendance: 0,
                title: "Early Leave",
                color: Colors.red,
              ),
            ),
          ],
        ),
      ],
    ),
  );

  Widget attendanceBox({
    required int attendance,
    required String title,
    required Color color,
    Function()? onTap,
  }) => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: color.withOpacity(.2),
      boxShadow: [
        Style.defaultShadow,
      ],
      border: Border(
        top: BorderSide(
          color: color,
          width: 3,
        ),
      ),
    ),
    padding: EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(attendance.toString(), style: Style.txt18Bold.copyWith(
          color: color,
          fontSize: 30,
        ),),
        const SizedBox(height: 10,),
        Row(
          children: [
            Expanded(
              child: Text(title, style: Style.txt16.copyWith(color: color),),
            ),
            const SizedBox(width: 5,),
            Icon(CupertinoIcons.right_chevron, color: color, size: 17,)
          ],
        ),
      ],
    ),
  );

  Widget get _buildExplore => Padding(
    padding: EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Explore", style: Style.txt25Bold,),
        const SizedBox(height: 20,),
        GridView.builder(
          itemCount: options.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            crossAxisCount: MediaQuery.sizeOf(context).width ~/ 200,
          ),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return CustomBounceWidget(
              scaleFactor: .3,
              isScrollable: true,
              onPressed: (){
                context.push(options[index].routeName);
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
                    options[index].icon,
                    Text(options[index].title, style: Style.txt16,),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    ),
  );
}