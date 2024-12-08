// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleModelImpl _$$ScheduleModelImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleModelImpl(
      id: (json['id'] as num?)?.toInt(),
      startTime: json['startTime'] == null
          ? null
          : DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
      courseId: (json['courseId'] as num?)?.toInt(),
      courseModel: json['courseModel'] == null
          ? null
          : CourseModel.fromJson(json['courseModel'] as Map<String, dynamic>),
      colorCode: json['colorCode'] as String?,
      createdBy: (json['createdBy'] as num?)?.toInt(),
      createdByModel: json['createdByModel'] == null
          ? null
          : UserModel.fromJson(json['createdByModel'] as Map<String, dynamic>),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
    );

Map<String, dynamic> _$$ScheduleModelImplToJson(_$ScheduleModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startTime': instance.startTime?.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
      'courseId': instance.courseId,
      'courseModel': instance.courseModel,
      'colorCode': instance.colorCode,
      'createdBy': instance.createdBy,
      'createdByModel': instance.createdByModel,
      'createdDate': instance.createdDate?.toIso8601String(),
    };
