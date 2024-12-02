import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_count_model.freezed.dart';
part 'attendance_count_model.g.dart';

@freezed
class AttendanceCountModel with _$AttendanceCountModel {

  factory AttendanceCountModel({
    int? p,
    int? l,
    int? a,
  }) = _AttendanceCountModel;

  factory AttendanceCountModel.fromJson(Map<String, dynamic> json) => _$AttendanceCountModelFromJson(json);

  static List<AttendanceCountModel> fromJsonArray(List body) => body.map((e) => AttendanceCountModel.fromJson(e)).toList();
}