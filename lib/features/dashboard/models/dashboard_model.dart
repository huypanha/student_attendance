import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:student_attendance/features/attendances/models/attendance_model.dart';
import 'package:student_attendance/features/courses/models/course_model.dart';

part 'dashboard_model.freezed.dart';
part 'dashboard_model.g.dart';

@freezed
class DashboardModel with _$DashboardModel {

  factory DashboardModel({
    CourseModel? course,
    @Default([])
    List<AttendanceModel>? attendances,
  }) = _DashboardModel;

  factory DashboardModel.fromJson(Map<String, dynamic> json) => _$DashboardModelFromJson(json);

  static List<DashboardModel> fromJsonArray(List body) => body.map((e) => DashboardModel.fromJson(e)).toList();
}