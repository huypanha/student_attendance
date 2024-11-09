import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:student_attendance/features/users/models/user_model.dart';

part 'schedule.freezed.dart';
part 'schedule.g.dart';

@freezed
class ScheduleModel with _$ScheduleModel {

  factory ScheduleModel({
    int? id,
    String? day,
    String? startTime,
    String? endTime,
    int? courseId,
    UserModel? createdBy,
    DateTime? createdDate,
  }) = _ScheduleModel;

  factory ScheduleModel.fromJson(Map<String, dynamic> json) => _$ScheduleModelFromJson(json);

  static List<ScheduleModel> fromJsonArray(List body) => body.map((e) => ScheduleModel.fromJson(e)).toList();
}