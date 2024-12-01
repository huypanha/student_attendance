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