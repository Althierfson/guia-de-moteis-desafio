import 'dart:convert';

import 'package:guia_moteis_desafio/modules/core/api_client/api_client.dart';
import 'package:guia_moteis_desafio/modules/core/api_client/response.dart';
import 'package:http/http.dart' as http;

class HttpApiClient implements ApiClient {
  final http.Client client;

  final String baseUrl;

  HttpApiClient({required this.client, required this.baseUrl});

  @override
  Future<Response> get(String path) async {
    http.Response response = await client.get(Uri.parse("$baseUrl$path"));

    return Response(
      statusCode: response.statusCode,
      body: utf8.decode(response.bodyBytes),
    );
  }

  @override
  Future<Response> post(String path, {Map<String, dynamic>? body}) async {
    http.Response response = await client.post(
      Uri.parse("$baseUrl$path"),
      body: body,
    );

    return Response(
      statusCode: response.statusCode,
      body: utf8.decode(response.bodyBytes),
    );
  }

  @override
  Future<Response> put(String path, {Map<String, dynamic>? body}) async {
    http.Response response = await client.put(
      Uri.parse("$baseUrl$path"),
      body: body,
    );

    return Response(
      statusCode: response.statusCode,
      body: utf8.decode(response.bodyBytes),
    );
  }

  @override
  Future<Response> delete(String path) async {
    http.Response response = await client.delete(Uri.parse("$baseUrl$path"));

    return Response(
      statusCode: response.statusCode,
      body: utf8.decode(response.bodyBytes),
    );
  }
}
