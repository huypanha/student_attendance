import 'dart:io';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dio/dio.dart';
import 'package:student_attendance/configs/data/remote.dart';
import 'package:student_attendance/utils/singleton.dart';

class AuthRepos {
  final RemoteDatabase _remote = RemoteDatabase();

  Future register(Map<String, dynamic> data, File profileImg) async {
    data['profileImg'] = await MultipartFile.fromFile(profileImg.path);
    return await _remote.create('auth/register', FormData.fromMap(data));
  }

  Future login(Map<String, dynamic> data) async {
    return await _remote.create('auth/login', FormData.fromMap({
      "token": JWT(data).sign(Singleton.instance.jwtSecret, expiresIn: Duration(minutes: 1))
    }));
  }
}