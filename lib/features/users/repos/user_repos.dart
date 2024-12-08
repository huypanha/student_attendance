import 'dart:io';

import 'package:dio/dio.dart';
import 'package:student_attendance/configs/data/remote.dart';
import 'package:student_attendance/utils/singleton.dart';

class UserRepos {
  final RemoteDatabase _remote = RemoteDatabase();

  Future get(Map<String, dynamic> where) async {
    await Singleton.instance.useUserToken();

    return await _remote.get('users', where: where);
  }

  Future update(Map<String, dynamic> data, File? profileImg) async {
    await Singleton.instance.useUserToken();

    if(profileImg != null) {
      data['profileImg'] = await MultipartFile.fromFile(profileImg.path);
    }
    return await _remote.update('users', FormData.fromMap(data));
  }

  Future deleteById(int id) async {
    await Singleton.instance.useUserToken();

    return await _remote.delete('users', FormData.fromMap({
      "id": id
    }));
  }
}