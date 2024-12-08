import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:student_attendance/features/users/models/user_model.dart';

part 'course_model.freezed.dart';
part 'course_model.g.dart';

@freezed
class CourseModel with _$CourseModel {

  factory CourseModel({
    int? id,
    String? subject,
    int? teacherId,
    UserModel? teacherModel,
    String? description,
    String? img,
    int? createdBy,
    UserModel? createdByModel,
    DateTime? createdAt,
    int? updatedBy,
    UserModel? updatedByModel,
    DateTime? updatedAt,

    @Default([])
    List<UserModel>? students,

    @Default([])
    List<int>? studentIds,

    @Default('A')
    String? status,
  }) = _CourseModel;

  factory CourseModel.fromJson(Map<String, dynamic> json) => _$CourseModelFromJson(json);

  static List<CourseModel> fromJsonArray(List body) => body.map((e) => CourseModel.fromJson(e)).toList();
}