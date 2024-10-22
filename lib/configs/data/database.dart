class Database {

  Future<List?> get(String key) async {
    throw UnimplementedError();
  }

  Future<String> create(String route, Map<String, dynamic> data) async {
    throw UnimplementedError();
  }

  Future update(Map<String, dynamic> data) async {
    throw UnimplementedError();
  }

  Future<bool> delete<T>(String collection, {Map<String, dynamic>? where, int? index}) async {
    throw UnimplementedError();
  }
}