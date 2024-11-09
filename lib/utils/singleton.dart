import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
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
  Isar? cacheDB;

  /// Used for update riverpod widget state
  WidgetRef? widgetRef;

  /// user login info
  // UserModel token = UserModel();

  /// context to pop from all pages
  BuildContext? rootContext;

  /// Controlling dashboard menu children
  var selectingMenuId = StateProvider<int>((ref) => 1);
  var dashboardChild = StateProvider<Widget>((ref) => const SizedBox());

  /// Configuration
  var dateFormat = DateFormat("dd/MM/yyyy");
  var dateTimeFormat = DateFormat("dd/MM/yyyy HH:mm:ss");

  // app document directory
  String appDocPath = "";

  UserModel user = UserModel();
}