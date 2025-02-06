import 'package:guia_moteis_desafio/modules/core/api_client/response.dart';

abstract class ApiClient {
  Future<Response> get(String path);
  Future<Response> post(String path, {Map<String, dynamic>? body});
  Future<Response> put(String path, {Map<String, dynamic>? body});
  Future<Response> delete(String path);
}
