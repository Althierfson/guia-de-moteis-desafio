import 'dart:convert';

import 'package:guia_moteis_desafio/modules/core/api_client/api_client.dart';
import 'package:guia_moteis_desafio/modules/core/utils/failure.dart';
import 'package:guia_moteis_desafio/modules/moteis/infra/datasources/moteis_remote_datasource.dart';
import 'package:guia_moteis_desafio/modules/moteis/infra/models/motel_model.dart';
import 'package:guia_moteis_desafio/utils/custom_debug_print.dart';

class MoteisRemoteDatasourceImpl implements MoteisRemoteDatasource {
  final ApiClient client;

  MoteisRemoteDatasourceImpl({required this.client});

  @override
  Future<List<MotelModel>> fetchMoteis(int page) async {
    try {
      // page: Para controle de paginação (Não utilizado no mock)
      final response = await client.get('/b/1IXK');

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final moteis = json['data']['moteis'];
        return (moteis as List).map((e) => MotelModel.fromJson(e)).toList();
      } else {
        customDebugPrint(
          "Erro ao buscar moteis\nStatusCode: ${response.statusCode}\nBody: ${response.body}",
          label: "MoteisRemoteDatasourceImpl.fetchMoteis",
        );
        throw ServerFailure();
      }
    } catch (e) {
      customDebugPrint(e.toString(), label: "MoteisRemoteDatasourceImpl.fetchMoteis");
      throw ServerFailure();
    }
  }
}
