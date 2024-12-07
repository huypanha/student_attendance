import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:student_attendance/features/attendances/models/attendance_count_model.dart';
import 'package:student_attendance/features/attendances/models/attendance_model.dart';
import 'package:student_attendance/features/courses/models/course_model.dart';
import 'package:student_attendance/utils/enums/enum_converter.dart';
import 'package:student_attendance/utils/enums/enums.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    int? id,
    String? stuId,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? phoneNumber,
    DateTime? dob,
    @UserTypeEnumConverter() UserType? type, // 0: for teacher, 1: for student
    int? createdBy,
    int? updatedBy,
    UserModel? createdByModel,
    UserModel? updatedByModel,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? lastActive,
    String? accessToken,
    AttendanceCountModel? attendanceCount,

    @Default(<CourseModel>[])
    List<CourseModel>? courses,

    @Default('A')
    String? status,

    @Default(<AttendanceModel>[])
    List<AttendanceModel>? attendances,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  static List<UserModel> fromJsonArray(List json) => json.map((e) => UserModel.fromJson(Map<String, dynamic>.from(e))).toList();
}