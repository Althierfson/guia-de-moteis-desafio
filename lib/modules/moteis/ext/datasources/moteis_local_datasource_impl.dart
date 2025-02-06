import 'dart:convert';

import 'package:guia_moteis_desafio/modules/core/database/database.dart';
import 'package:guia_moteis_desafio/modules/core/utils/failure.dart';
import 'package:guia_moteis_desafio/modules/moteis/infra/datasources/moteis_local_datasource.dart';
import 'package:guia_moteis_desafio/modules/moteis/infra/models/motel_model.dart';
import 'package:guia_moteis_desafio/utils/custom_debug_print.dart';

class MoteisLocalDatasourceImpl implements MoteisLocalDatasource {
  final Database database;

  const MoteisLocalDatasourceImpl({required this.database});

  final String _requestKey = "requestKey";

  @override
  Future<List<MotelModel>> fetchMoteis() async {
    try {
      final data = await database.getData(_requestKey);
      final json = jsonDecode(data);
      return (json as List).map((e) => MotelModel.fromJson(e)).toList();
    } catch (e) {
      customDebugPrint(e.toString(), label: "MoteisLocalDatasourceImpl.fetchMoteis");
      throw LocalDatabaseFailure();
    }
  }

  @override
  Future<void> saveMoteis(List<MotelModel> moteis) async {
    try {
      final data = jsonEncode(moteis.map((e) => e.toJson()).toList());
      await database.saveData(_requestKey, data: data);
      return;
    } catch (e) {
      customDebugPrint(e.toString(), label: "MoteisLocalDatasourceImpl.saveMoteis");
      throw LocalDatabaseFailure();
    }
  }
}
