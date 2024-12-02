// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_count_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendanceCountModelImpl _$$AttendanceCountModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceCountModelImpl(
      p: (json['p'] as num?)?.toInt(),
      l: (json['l'] as num?)?.toInt(),
      a: (json['a'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AttendanceCountModelImplToJson(
        _$AttendanceCountModelImpl instance) =>
    <String, dynamic>{
      'p': instance.p,
      'l': instance.l,
      'a': instance.a,
    };
