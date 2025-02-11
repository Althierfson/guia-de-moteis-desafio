import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis_desafio/modules/core/api_client/api_client.dart';
import 'package:guia_moteis_desafio/modules/core/api_client/response.dart';
import 'package:guia_moteis_desafio/modules/core/utils/failure.dart';
import 'package:guia_moteis_desafio/modules/moteis/ext/datasources/moteis_remote_datasource_impl.dart';
import 'package:guia_moteis_desafio/modules/moteis/infra/models/motel_model.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../mocks/mocks_data.dart';

class MockApiClient extends Mock implements ApiClient {}

void main() {
  late MockApiClient mockApiClient;
  late MoteisRemoteDatasourceImpl remote;

  setUp(() async {
    mockApiClient = MockApiClient();
    remote = MoteisRemoteDatasourceImpl(client: mockApiClient);
  });

  // Arrage
  group("MoteisRemoteDatasourceImpl.fetchMoteis", () {
    test("Deve retornar uma lista de [Motel] quando o localDatasource tiver sucesso", () async {
      // Arrage
      String path = "/b/1IXK";
      List<MotelModel> expectedResult = [MockData.motelMock];
      String mockJson = await readMock("moteis_list.json");
      when(() => mockApiClient.get(path))
          .thenAnswer((_) async => Response(statusCode: 200, body: mockJson));

      // act
      final result = await remote.fetchMoteis(1);

      // Asset
      expect(result, equals(expectedResult));
      verify(() => mockApiClient.get(path)).called(1);
      verifyNoMoreInteractions(mockApiClient);
    });

    test("Deve retornar (throw) uma [Failure] quando o ApiClient falhar", () async {
      // Arrage
      String path = "/b/1IXK";

      when(() => mockApiClient.get(path)).thenThrow(SocketException("failure"));

      // Act & Assert
      expect(() async => await remote.fetchMoteis(1), throwsA(isA<ServerFailure>()));

      verify(() => mockApiClient.get(path)).called(1);
      verifyNoMoreInteractions(mockApiClient);
    });
  });
}
