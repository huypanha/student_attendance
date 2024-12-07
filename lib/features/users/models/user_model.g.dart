// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: (json['id'] as num?)?.toInt(),
      stuId: json['stuId'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      type: _$JsonConverterFromJson<int, UserType>(
          json['type'], const UserTypeEnumConverter().fromJson),
      createdBy: (json['createdBy'] as num?)?.toInt(),
      updatedBy: (json['updatedBy'] as num?)?.toInt(),
      createdByModel: json['createdByModel'] == null
          ? null
          : UserModel.fromJson(json['createdByModel'] as Map<String, dynamic>),
      updatedByModel: json['updatedByModel'] == null
          ? null
          : UserModel.fromJson(json['updatedByModel'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      lastActive: json['lastActive'] == null
          ? null
          : DateTime.parse(json['lastActive'] as String),
      accessToken: json['accessToken'] as String?,
      attendanceCount: json['attendanceCount'] == null
          ? null
          : AttendanceCountModel.fromJson(
              json['attendanceCount'] as Map<String, dynamic>),
      courses: (json['courses'] as List<dynamic>?)
              ?.map((e) => CourseModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <CourseModel>[],
      status: json['status'] as String? ?? 'A',
      attendances: (json['attendances'] as List<dynamic>?)
              ?.map((e) => AttendanceModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <AttendanceModel>[],
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'stuId': instance.stuId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'phoneNumber': instance.phoneNumber,
      'dob': instance.dob?.toIso8601String(),
      'type': _$JsonConverterToJson<int, UserType>(
          instance.type, const UserTypeEnumConverter().toJson),
      'createdBy': instance.createdBy,
      'updatedBy': instance.updatedBy,
      'createdByModel': instance.createdByModel,
      'updatedByModel': instance.updatedByModel,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'lastActive': instance.lastActive?.toIso8601String(),
      'accessToken': instance.accessToken,
      'attendanceCount': instance.attendanceCount,
      'courses': instance.courses,
      'status': instance.status,
      'attendances': instance.attendances,
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
