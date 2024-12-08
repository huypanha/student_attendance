// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_count_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendanceCountModelImpl _$$AttendanceCountModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceCountModelImpl(
      p: (json['p'] as num?)?.toInt() ?? 0,
      l: (json['l'] as num?)?.toInt() ?? 0,
      a: (json['a'] as num?)?.toInt() ?? 0,
      total: (json['total'] as num?)?.toInt() ?? 0,
      clockIn: (json['clockIn'] as num?)?.toInt() ?? 0,
      clockOut: (json['clockOut'] as num?)?.toInt() ?? 0,
      late: (json['late'] as num?)?.toInt() ?? 0,
      earlyLeave: (json['earlyLeave'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$AttendanceCountModelImplToJson(
        _$AttendanceCountModelImpl instance) =>
    <String, dynamic>{
      'p': instance.p,
      'l': instance.l,
      'a': instance.a,
      'total': instance.total,
      'clockIn': instance.clockIn,
      'clockOut': instance.clockOut,
      'late': instance.late,
      'earlyLeave': instance.earlyLeave,
    };
