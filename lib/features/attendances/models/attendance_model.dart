import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:student_attendance/features/courses/models/course_model.dart';
import 'package:student_attendance/features/users/models/user_model.dart';

import '../../../utils/utils.dart';

part 'attendance_model.freezed.dart';
part 'attendance_model.g.dart';

@freezed
class AttendanceModel with _$AttendanceModel {

  factory AttendanceModel({
    int? id,
    int? stuId,
    UserModel? student,
    int? courseId,
    CourseModel? course,
    DateTime? createdAt,
    @AttendanceTypeEnumConverter()
    AttendanceType? type,
  }) = _AttendanceModel;

  factory AttendanceModel.fromJson(Map<String, dynamic> json) => _$AttendanceModelFromJson(json);

  static List<AttendanceModel> fromJsonArray(List body) => body.map((e) => AttendanceModel.fromJson(e)).toList();
}