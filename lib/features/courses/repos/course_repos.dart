import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:student_attendance/configs/data/remote.dart';
import 'package:student_attendance/features/courses/models/course_model.dart';
import 'package:student_attendance/utils/singleton.dart';

class CourseRepos {
  final RemoteDatabase _remote = RemoteDatabase();

  Future create(Map<String, dynamic> data, String? imgPath) async {
    await Singleton.instance.useUserToken();

    if(imgPath != null) {
      data['imgFile'] = await MultipartFile.fromFile(imgPath);
    }

    if(data['studentIds'] != null) {
      data['studentIds'] = jsonEncode(data['studentIds']);
    }

    return await _remote.create('courses', FormData.fromMap(data));
  }

  Future<List<CourseModel>?> get(Map<String, dynamic> where) async {
    await Singleton.instance.useUserToken();

    var res = await _remote.get('courses', where: where);
    if(res != null){
      return CourseModel.fromJsonArray(res);
    }
    return null;
  }

  Future update(Map<String, dynamic> data, String? imgPath) async {
    await Singleton.instance.useUserToken();

    if(imgPath != null) {
      data['imgFile'] = await MultipartFile.fromFile(imgPath);
    }

    if(data['studentIds'] != null) {
      data['studentIds'] = jsonEncode(data['studentIds']);
    }

    return await _remote.update('courses', FormData.fromMap(data));
  }

  Future deleteById(int id) async {
    await Singleton.instance.useUserToken();

    return await _remote.delete('courses', FormData.fromMap({
      "id": id
    }));
  }
}