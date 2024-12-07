import 'package:student_attendance/utils/utils.dart';

class ReturnPageDataModel {
  ReturnPageType returnType;
  dynamic data;

  ReturnPageDataModel({
    this.returnType = ReturnPageType.none,
    required this.data,
  });
}