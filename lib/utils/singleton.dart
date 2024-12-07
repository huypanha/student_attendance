import 'dart:developer';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce/hive.dart';
import 'package:intl/intl.dart';
import 'package:student_attendance/features/users/models/user_model.dart';

class Singleton {
  Singleton.internal(){
    log("Singleton instance created!");
  }
  static final Singleton instance = Singleton.internal();
  factory Singleton() => instance;

  // progress value
  final totalSendReceiveProgress = StateProvider<double>((ref) => 0);
  final totalProgress = StateProvider<double>((ref) => 1);

  /// Local db for store all app configurations that using key and values
  Box? cacheDB;

  /// Used for update riverpod widget state
  WidgetRef? widgetRef;

  /// user login info
  UserModel token = UserModel();

  /// context to pop from all pages
  BuildContext? rootContext;

  /// Controlling dashboard menu children
  var selectingMenuId = StateProvider<int>((ref) => 1);
  var dashboardChild = StateProvider<Widget>((ref) => const SizedBox());

  /// Configuration
  var dateFormat = DateFormat("dd/MM/yyyy");
  var dateTimeFormat = DateFormat("dd/MM/yyyy HH:mm:ss");

  /// App document directory
  String appDocPath = "";

  /// Count late after 15 minutes
  int lateAfterMin = 15;

  /// API request auth
  Dio dio = Dio()
  ..options.headers = {
    "Authorization": "",
    "Content-Type": "application/json"
  }
  ..options.connectTimeout = Duration(seconds: 10)
  ..options.validateStatus = (_) => true;
  String errorMsg = "";
  SecretKey jwtSecret = SecretKey("709d25e094faa6ca2556c818166b7a9563b93f7099f6f0f4caa6cf63b88e8d3e7");

  Future useDefaultToken() async {
    dio.options.headers['Authorization'] = "Bearer dhFdlDSFhdLDfhajfdHDFjhkajhsdfGDSFljkhsdalfahf";
  }

  Future useUserToken() async {
    dio.options.headers['Authorization'] = "Bearer ${token.accessToken}";
  }
}