// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseModelImpl _$$CourseModelImplFromJson(Map<String, dynamic> json) =>
    _$CourseModelImpl(
      id: (json['id'] as num?)?.toInt(),
      subject: json['subject'] as String?,
      teacherId: (json['teacherId'] as num?)?.toInt(),
      teacherModel: json['teacherModel'] == null
          ? null
          : UserModel.fromJson(json['teacherModel'] as Map<String, dynamic>),
      description: json['description'] as String?,
      img: json['img'] as String?,
      createdBy: (json['createdBy'] as num?)?.toInt(),
      createdByModel: json['createdByModel'] == null
          ? null
          : UserModel.fromJson(json['createdByModel'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedBy: (json['updatedBy'] as num?)?.toInt(),
      updatedByModel: json['updatedByModel'] == null
          ? null
          : UserModel.fromJson(json['updatedByModel'] as Map<String, dynamic>),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      students: (json['students'] as List<dynamic>?)
              ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      studentIds: (json['studentIds'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      status: json['status'] as String? ?? 'A',
    );

Map<String, dynamic> _$$CourseModelImplToJson(_$CourseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subject': instance.subject,
      'teacherId': instance.teacherId,
      'teacherModel': instance.teacherModel,
      'description': instance.description,
      'img': instance.img,
      'createdBy': instance.createdBy,
      'createdByModel': instance.createdByModel,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedBy': instance.updatedBy,
      'updatedByModel': instance.updatedByModel,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'students': instance.students,
      'studentIds': instance.studentIds,
      'status': instance.status,
    };
