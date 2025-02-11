import 'dart:convert';

import 'package:guia_moteis_desafio/modules/core/api_client/api_client.dart';
import 'package:guia_moteis_desafio/modules/core/utils/failure.dart';
import 'package:guia_moteis_desafio/modules/moteis/ext/datasources/mock_paginacao.dart';
import 'package:guia_moteis_desafio/modules/moteis/infra/datasources/moteis_remote_datasource.dart';
import 'package:guia_moteis_desafio/modules/moteis/infra/models/motel_model.dart';
import 'package:guia_moteis_desafio/utils/custom_debug_print.dart';

class MoteisRemoteDatasourceImpl implements MoteisRemoteDatasource {
  final ApiClient client;

  MoteisRemoteDatasourceImpl({required this.client});

  // apenas necessario para simulação de paginação
  int pageControllerMock = 0;

  @override
  Future<List<MotelModel>> fetchMoteis(int page) async {
    try {
      // page: Para controle de paginação (Não necessario para a APi mock disponibilizada)
      final response = await client.get('/b/1IXK');

      // ! apenas necessario para simulação de paginação
      if (page > 1 && page < 4) {
        await Future.delayed(Duration(milliseconds: 500));
        return pageResponse[pageControllerMock++];
      }

      if (page >= 4) {
        return [];
      }

      // ! apenas necessario para simulação de paginação

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
