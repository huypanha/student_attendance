// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseModelImpl _$$CourseModelImplFromJson(Map<String, dynamic> json) =>
    _$CourseModelImpl(
      id: (json['id'] as num?)?.toInt(),
      courseName: json['courseName'] as String?,
      teacher: json['teacher'] == null
          ? null
          : UserModel.fromJson(json['teacher'] as Map<String, dynamic>),
      description: json['description'] as String?,
      img: json['img'] as String?,
      createdBy: json['createdBy'] == null
          ? null
          : UserModel.fromJson(json['createdBy'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedBy: json['updatedBy'] == null
          ? null
          : UserModel.fromJson(json['updatedBy'] as Map<String, dynamic>),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      students: (json['students'] as List<dynamic>?)
          ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CourseModelImplToJson(_$CourseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'courseName': instance.courseName,
      'teacher': instance.teacher,
      'description': instance.description,
      'img': instance.img,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedBy': instance.updatedBy,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'students': instance.students,
    };
