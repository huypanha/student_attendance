import 'dart:io';

import 'package:dio/dio.dart';
import 'package:student_attendance/configs/data/remote.dart';

class RegisterRepos {
  final RemoteDatabase _remote = RemoteDatabase();

  Future register(Map<String, dynamic> data, File profileImg) async {
    data['profileImg'] = await MultipartFile.fromFile(profileImg.path);
    return await _remote.create('auth/register', FormData.fromMap(data));
  }
}