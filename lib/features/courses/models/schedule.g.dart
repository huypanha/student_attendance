// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleModelImpl _$$ScheduleModelImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleModelImpl(
      id: (json['id'] as num?)?.toInt(),
      day: json['day'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      courseId: (json['courseId'] as num?)?.toInt(),
      createdBy: json['createdBy'] == null
          ? null
          : UserModel.fromJson(json['createdBy'] as Map<String, dynamic>),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
    );

Map<String, dynamic> _$$ScheduleModelImplToJson(_$ScheduleModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'day': instance.day,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'courseId': instance.courseId,
      'createdBy': instance.createdBy,
      'createdDate': instance.createdDate?.toIso8601String(),
    };
