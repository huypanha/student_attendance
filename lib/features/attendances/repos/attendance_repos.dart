import 'package:dio/dio.dart';
import 'package:student_attendance/configs/data/remote.dart';
import 'package:student_attendance/features/courses/models/course_model.dart';
import 'package:student_attendance/utils/singleton.dart';

class AttendanceRepos {
  final RemoteDatabase _remote = RemoteDatabase();

  Future create(Map<String, dynamic> data) async {
    await Singleton.instance.useUserToken();

    return await _remote.create('attendances', FormData.fromMap(data));
  }

  Future<List<CourseModel>?> get(Map<String, dynamic> where) async {
    await Singleton.instance.useUserToken();

    var res = await _remote.get('attendances', where: where);
    if(res != null){
      return CourseModel.fromJsonArray(res);
    }
    return null;
  }
}