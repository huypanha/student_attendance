import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:student_attendance/utils/enums/enums.dart';

class UserTypeEnumConverter implements JsonConverter<UserType, int> {
  const UserTypeEnumConverter();

  @override
  UserType fromJson(int json) {
    return UserType.values[json]; // Convert index to Enum
  }

  @override
  int toJson(UserType object) {
    return object.index; // Convert Enum to index
  }
}

class AttendanceTypeEnumConverter implements JsonConverter<AttendanceType, int> {
  const AttendanceTypeEnumConverter();

  @override
  AttendanceType fromJson(int json) {
    return AttendanceType.values[json]; // Convert index to Enum
  }

  @override
  int toJson(AttendanceType object) {
    return object.index; // Convert Enum to index
  }
}