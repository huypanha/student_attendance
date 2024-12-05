import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_attendance/features/attendances/models/attendance_count_model.dart';
import 'package:student_attendance/features/schedules/models/schedule.dart';

import '../../../utils/utils.dart';
import '../../users/models/user_model.dart';

class ReportForTeacher extends StatefulWidget {
  const ReportForTeacher({
    super.key,
  });

  static const routeName = '/report-for-teacher';

  @override
  State<ReportForTeacher> createState() => _ReportForTeacherState();
}

class _ReportForTeacherState extends State<ReportForTeacher> {
  int touchedIndex = -1;
  List<UserModel> students = [
    UserModel(
      id: 1,
      firstName: "Huy",
      lastName: "Panha",
      email: "panha@test.com",
      type: UserType.student,
      stuId: "SS1001",
      phoneNumber: "0123456789",
      dob: DateTime.now(),
      createdAt: DateTime.now(),
      lastActive: DateTime.now(),
      attendanceCount: AttendanceCountModel(
        p: 100,
        l: 10,
        a: 0,
      ),
    ),
    UserModel(
      id: 2,
      firstName: "Huy",
      lastName: "Samrech",
      email: "samrech@test.com",
      type: UserType.student,
      stuId: "SS1002",
      phoneNumber: "0123456789",
      dob: DateTime.now(),
      createdAt: DateTime.now(),
      lastActive: DateTime.now(),
      attendanceCount: AttendanceCountModel(
        p: 10,
        l: 10,
        a: 0,
      ),
    ),
    UserModel(
      id: 3,
      firstName: "Om",
      lastName: "Chanpiseth",
      email: "piseth@test.com",
      type: UserType.student,
      stuId: "SS1003",
      phoneNumber: "0123456789",
      dob: DateTime.now(),
      createdAt: DateTime.now(),
      lastActive: DateTime.now(),
      attendanceCount: AttendanceCountModel(
        p: 1,
        l: 10,
        a: 10,
      ),
    ),
    UserModel(
      id: 3,
      firstName: "Kong",
      lastName: "Leng",
      email: "leng@test.com",
      type: UserType.student,
      stuId: "SS1004",
      phoneNumber: "0123456789",
      dob: DateTime.now(),
      createdAt: DateTime.now(),
      lastActive: DateTime.now(),
      attendanceCount: AttendanceCountModel(
        p: 0,
        l: 10,
        a: 10,
      ),
    ),
    UserModel(
      id: 3,
      firstName: "Yourk",
      lastName: "Chhunlay",
      email: "chhunlay@test.com",
      type: UserType.student,
      stuId: "SS1005",
      phoneNumber: "0123456789",
      dob: DateTime.now(),
      createdAt: DateTime.now(),
      lastActive: DateTime.now(),
      attendanceCount: AttendanceCountModel(
        p: 99,
        l: 10,
        a: 10,
      ),
    ),
  ];
  late ScheduleModel currentSchedule;

  @override
  void initState() {
    super.initState();
    currentSchedule = ScheduleModel(
      id: 1,
      startTime: DateTime(2024, 12, 2, 0, 0),
      endTime: DateTime(2024, 12, 2, 1, 0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          title: Text("Reports", style: Style.txt20Bold,),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
          ),
          actions: [
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.filter_list),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              _buildChart,
              const SizedBox(height: 10,),
              _buildChartLabel,
              const SizedBox(height: 30,),
              _buildReports,
            ],
          ),
        ),
      ),
    );
  }

  Widget get _buildChart => Center(
    child: SizedBox(
      height: MediaQuery.sizeOf(context).width > 300 ? 200 : MediaQuery.sizeOf(context).width * .7,
      width: MediaQuery.sizeOf(context).width > 300 ? 200 : MediaQuery.sizeOf(context).width * .7,
      child: PieChart(
        PieChartData(
          pieTouchData: PieTouchData(
            touchCallback: (FlTouchEvent event, pieTouchResponse) {
              setState(() {
                if (!event.isInterestedForInteractions || pieTouchResponse == null ||
                    pieTouchResponse.touchedSection == null) {
                  touchedIndex = -1;
                  return;
                }
                touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
              });
            },
          ),
          borderData: FlBorderData(
            show: false,
          ),
          sectionsSpace: 0,
          centerSpaceRadius: 40,
          sections: showingSections(),
        ),
      ),
    ),
  );

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.green,
            value: 60,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.orange,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.red,
            value: 10,
            title: '10%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }

  Widget get _buildChartLabel => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 17,
            height: 17,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
          ),
          const SizedBox(width: 5,),
          Text("Present", style: Style.txt14Black,),
        ],
      ),
      const SizedBox(width: 10,),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 17,
            height: 17,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orange,
            ),
          ),
          const SizedBox(width: 5,),
          Text("Late", style: Style.txt14Black,),
        ],
      ),
      const SizedBox(width: 10,),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 17,
            height: 17,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
          ),
          const SizedBox(width: 5,),
          Text("Absent", style: Style.txt14Black,),
        ],
      ),
    ],
  );

  Widget get _buildReports => Column(
    children: [
      Container(
        decoration: BoxDecoration(
          color: Style.primaryColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          border: Border.all(
            color: Style.primaryColor,
          ),
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: Text("Student", style: Style.txt16White,),
            ),
            const SizedBox(width: 10,),
            SizedBox(
              width: 30,
              child: Center(child: Text("P", style: Style.txt16White,)),
            ),
            const SizedBox(width: 10,),
            SizedBox(
              width: 30,
              child: Center(child: Text("L", style: Style.txt16White,)),
            ),
            const SizedBox(width: 10,),
            SizedBox(
              width: 30,
              child: Center(child: Text("A", style: Style.txt16White,)),
            ),
          ],
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
          border: Border.all(
            color: Style.primaryColor,
          ),
        ),
        child: Column(
          children: List.generate(students.length, (index) {
            var item = students[index];
            return Container(
              color: index % 2 == 0 ? Colors.transparent : Style.primaryColor.withOpacity(.1),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal:  10),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        item.avatar(),
                        const SizedBox(width: 10,),
                        Text(item.fullName, style: Style.txt16,),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10,),
                  SizedBox(
                    width: 30,
                    child: Center(child: Text(item.attendanceCount!.p.toString(), style: Style.txt16.copyWith(color: Colors.green, fontWeight: FontWeight.bold),)),
                  ),
                  const SizedBox(width: 10,),
                  SizedBox(
                    width: 30,
                    child: Center(child: Text(item.attendanceCount!.l.toString(), style: Style.txt16.copyWith(color: Colors.orange, fontWeight: FontWeight.bold),)),
                  ),
                  const SizedBox(width: 10,),
                  SizedBox(
                    width: 30,
                    child: Center(child: Text(item.attendanceCount!.a.toString(), style: Style.txt16.copyWith(color: Colors.red, fontWeight: FontWeight.bold),)),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    ],
  );
}
