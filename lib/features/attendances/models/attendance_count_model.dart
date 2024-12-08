import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_count_model.freezed.dart';
part 'attendance_count_model.g.dart';

@freezed
class AttendanceCountModel with _$AttendanceCountModel {

  factory AttendanceCountModel({
    @Default(0)
    int? p,
    @Default(0)
    int? l,
    @Default(0)
    int? a,
    @Default(0)
    int? total,
    @Default(0)
    int? clockIn,
    @Default(0)
    int? clockOut,
    @Default(0)
    int? late,
    @Default(0)
    int? earlyLeave,
  }) = _AttendanceCountModel;

  factory AttendanceCountModel.fromJson(Map<String, dynamic> json) => _$AttendanceCountModelFromJson(json);

  static List<AttendanceCountModel> fromJsonArray(List body) => body.map((e) => AttendanceCountModel.fromJson(e)).toList();
}