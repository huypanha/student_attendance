import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:student_attendance/configs/data/database.dart';
import 'package:student_attendance/configs/data/domain.dart';
import 'package:student_attendance/utils/singleton.dart';

class RemoteDatabase extends Database {

  @override
  Future get(String route, {Map<String, dynamic>? where}) async {
    try {
      var res = await Singleton.instance.dio.get("${Domain.baseUrl}/$route", data: where);
      if(res.statusCode == 200){
        return res.data;
      } else {
        Singleton.instance.errorMsg = res.data['detail'];
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        Singleton.instance.errorMsg = "Connection timeout";
      } else if (e.type == DioExceptionType.receiveTimeout) {
        Singleton.instance.errorMsg = "Receive timeout";
      } else if (e.type == DioExceptionType.connectionError) {
        Singleton.instance.errorMsg = "Unable to connect to server";
      } else {
        Singleton.instance.errorMsg = "Server error";
      }
    } catch(e) {
      log(e.toString());
      Singleton.instance.errorMsg = "Something when wrong";
    }
    return null;
  }

  @override
  Future create(String route, FormData data) async {
    try {
      var res = await Singleton.instance.dio.post("${Domain.baseUrl}/$route", data: data, onSendProgress: (s, t) {
        log("Sent: $s, Total: $t");
        Singleton.instance.widgetRef?.read(Singleton.instance.totalSendReceiveProgress.notifier).state = s.toDouble();
        Singleton.instance.widgetRef?.watch(Singleton.instance.totalProgress.notifier).state = t.toDouble();
      });

      if(res.statusCode == 200){
        return res.data;
      } else {
        log(res.toString());
        Singleton.instance.errorMsg = res.data['detail'];
      }
    } on DioException catch (e) {
      log(e.toString());
      if (e.type == DioExceptionType.connectionTimeout) {
        Singleton.instance.errorMsg = "Connection timeout";
      } else if (e.type == DioExceptionType.receiveTimeout) {
        Singleton.instance.errorMsg = "Receive timeout";
      } else if (e.type == DioExceptionType.connectionError) {
        Singleton.instance.errorMsg = "Unable to connect to server";
      } else {
        Singleton.instance.errorMsg = "Server error";
      }
    } catch(e) {
      log(e.toString());
      Singleton.instance.errorMsg = "Something when wrong";
    }
    return null;
  }

  @override
  Future update(String? route, FormData data) async {
    try {
      var res = await Singleton.instance.dio.put("${Domain.baseUrl}/$route", data: data, onSendProgress: (r, t) {
        Singleton.instance.widgetRef?.read(Singleton.instance.totalSendReceiveProgress.notifier).state = r.toDouble();
        Singleton.instance.widgetRef?.watch(Singleton.instance.totalProgress.notifier).state = t.toDouble();
      });

      if(res.statusCode == 200){
        return res.data;
      } else {
        Singleton.instance.errorMsg = res.data['detail'];
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        Singleton.instance.errorMsg = "Connection timeout";
      } else if (e.type == DioExceptionType.receiveTimeout) {
        Singleton.instance.errorMsg = "Receive timeout";
      } else if (e.type == DioExceptionType.connectionError) {
        Singleton.instance.errorMsg = "Unable to connect to server";
      } else {
        Singleton.instance.errorMsg = "Server error";
      }
    } catch(e) {
      log(e.toString());
      Singleton.instance.errorMsg = "Something when wrong";
    }
    return null;
  }

  @override
  Future<bool> delete(String route, FormData where) async {
    try {
      var res = await Singleton.instance.dio.delete("${Domain.baseUrl}/$route", data: where);

      if(res.statusCode == 200){
        return true;
      } else {
        Singleton.instance.errorMsg = res.data['detail'];
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        Singleton.instance.errorMsg = "Connection timeout";
      } else if (e.type == DioExceptionType.receiveTimeout) {
        Singleton.instance.errorMsg = "Receive timeout";
      } else if (e.type == DioExceptionType.connectionError) {
        Singleton.instance.errorMsg = "Unable to connect to server";
      } else {
        Singleton.instance.errorMsg = "Server error";
      }
    } catch(e) {
      log(e.toString());
      Singleton.instance.errorMsg = "Something when wrong";
    }
    return false;
  }
}