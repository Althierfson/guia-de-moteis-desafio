abstract class Database {
  Future<void> saveData(String key, {required dynamic data});
  Future<void> updataData(String key, {required dynamic data});
  Future<dynamic> getData(String key);
  Future<void> deleteData(String key);
}
