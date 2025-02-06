import 'package:guia_moteis_desafio/modules/core/database/database.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

class HiveDatabase implements Database {
  late Box _hive;

  HiveDatabase() {
    _initDatabase();
  }

  Future<void> _initDatabase() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
  }

  Future<void> _openBox() async {
    _hive = await Hive.openBox("app_database");
  }

  Future<void> _closeBox() async {
    await _hive.close();
  }

  @override
  Future<void> deleteData(String key) async {
    return _callDatabase(() async => await _hive.delete(key));
  }

  @override
  Future<dynamic> getData(String key) async {
    return _callDatabase(() async => await _hive.get(key));
  }

  @override
  Future<void> saveData(String key, {required dynamic data}) async {
    return _callDatabase(() async => await _hive.put(key, data));
  }

  @override
  Future<void> updataData(String key, {required dynamic data}) {
    return _callDatabase(() async => await _hive.put(key, data));
  }

  Future<R> _callDatabase<R>(Future<R> Function() operation) async {
    await _openBox();
    R result = await operation();
    await _closeBox();
    return result;
  }
}
