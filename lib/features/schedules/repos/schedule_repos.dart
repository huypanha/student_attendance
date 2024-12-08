import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:student_attendance/configs/data/remote.dart';
import 'package:student_attendance/features/schedules/models/schedule.dart';
import 'package:student_attendance/utils/singleton.dart';

class ScheduleRepos {
  final RemoteDatabase _remote = RemoteDatabase();

  Future create(String json) async {
    await Singleton.instance.useUserToken();
    return await _remote.create('schedule', FormData.fromMap({
      "data": json
    }));
  }

  Future<List<ScheduleModel>?> get(Map<String, dynamic> where) async {
    await Singleton.instance.useUserToken();

    var res = await _remote.get('schedule', where: where);
    if(res != null){
      return ScheduleModel.fromJsonArray(res);
    }
    return null;
  }

  Future update(List<ScheduleModel> newDatas) async {
    await Singleton.instance.useUserToken();

    return await _remote.update('schedule', FormData.fromMap({
      "new_data": jsonEncode(newDatas),
    }));
  }

  Future delete(List<int> ids) async {
    await Singleton.instance.useUserToken();

    return await _remote.delete('schedule', FormData.fromMap({
      "ids": jsonEncode(ids),
    }));
  }
}