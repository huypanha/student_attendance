import 'package:dio/dio.dart';

abstract class Database {

  Future get(String route, {Map<String, dynamic>? where}) async {
    throw UnimplementedError();
  }

  Future create(String route, FormData data) async {
    throw UnimplementedError();
  }

  Future update(String? route, FormData data) async {
    throw UnimplementedError();
  }

  Future<bool> delete(String route, FormData where) async {
    throw UnimplementedError();
  }
}