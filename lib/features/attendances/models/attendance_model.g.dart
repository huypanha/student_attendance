// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendanceModelImpl _$$AttendanceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceModelImpl(
      id: (json['id'] as num?)?.toInt(),
      stuId: (json['stuId'] as num?)?.toInt(),
      student: json['student'] == null
          ? null
          : UserModel.fromJson(json['student'] as Map<String, dynamic>),
      courseId: (json['courseId'] as num?)?.toInt(),
      course: json['course'] == null
          ? null
          : CourseModel.fromJson(json['course'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      type: _$JsonConverterFromJson<int, AttendanceType>(
          json['type'], const AttendanceTypeEnumConverter().fromJson),
    );

Map<String, dynamic> _$$AttendanceModelImplToJson(
        _$AttendanceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'stuId': instance.stuId,
      'student': instance.student,
      'courseId': instance.courseId,
      'course': instance.course,
      'createdAt': instance.createdAt?.toIso8601String(),
      'type': _$JsonConverterToJson<int, AttendanceType>(
          instance.type, const AttendanceTypeEnumConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
