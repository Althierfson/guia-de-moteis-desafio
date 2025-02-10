import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis_desafio/modules/core/network/network_info.dart';
import 'package:guia_moteis_desafio/modules/core/utils/failure.dart';
import 'package:guia_moteis_desafio/modules/moteis/domain/entities/motel.dart';
import 'package:guia_moteis_desafio/modules/moteis/infra/datasources/moteis_remote_datasource.dart';
import 'package:guia_moteis_desafio/modules/moteis/infra/models/motel_model.dart';
import 'package:guia_moteis_desafio/modules/moteis/infra/repositories/moteis_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks/mocks_data.dart';

class MockMoteisRemoteDatasource extends Mock implements MoteisRemoteDatasource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late MockMoteisRemoteDatasource mockRemote;
  late MockNetworkInfo mockNetworkInfo;
  late MoteisRepositoryImpl repository;

  setUp(() async {
    mockRemote = MockMoteisRemoteDatasource();
    mockNetworkInfo = MockNetworkInfo();
    repository = MoteisRepositoryImpl(remoteDatasource: mockRemote, networkInfo: mockNetworkInfo);
  });

  group("MoteisRepositoryImpl.fetchMoteis", () {
    // Arrage
    group("Quando há conexão com a internet", () {
      test("Deve retornar uma lista de [Moetel] quando o localDatasource tiver sucesso", () async {
        // Arrage
        int page = 1;
        List<Motel> expectedResult = [MockData.motelMock.toEntity()];
        when(() => mockNetworkInfo.hasConnection).thenAnswer((_) async => true);
        when(() => mockRemote.fetchMoteis(page))
            .thenAnswer((_) async => [MotelModel.fromEntity(MockData.motelMock.toEntity())]);

        // act
        final result = await repository.fetchMoteis(page);

        // Asset
        expect(result, isA<Right>());
        expect(result.fold((l) => l, (r) => r), equals(expectedResult));
        verify(() => mockRemote.fetchMoteis(page)).called(1);
        verifyNoMoreInteractions(mockRemote);
      });

      test("Deve retornar uma [Failure] quando o localDatasource lançar uma Failure", () async {
        // Arrage
        int page = 1;
        Failure expectedResult = ServerFailure();
        when(() => mockNetworkInfo.hasConnection).thenAnswer((_) async => true);
        when(() => mockRemote.fetchMoteis(page)).thenThrow(expectedResult);

        // act
        final result = await repository.fetchMoteis(page);

        // Asset
        expect(result, isA<Left>());
        expect(result.fold((l) => l, (r) => r), equals(expectedResult));
        verify(() => mockRemote.fetchMoteis(page)).called(1);
        verifyNoMoreInteractions(mockRemote);
      });

      test("Deve retornar uma [Failure] quando o localDatasource lançar uma qualquer Exception",
          () async {
        // Arrage
        int page = 1;
        when(() => mockNetworkInfo.hasConnection).thenAnswer((_) async => true);
        when(() => mockRemote.fetchMoteis(page)).thenThrow(Exception());

        // act
        final result = await repository.fetchMoteis(page);

        // Asset
        expect(result, isA<Left>());
        expect(result.fold((l) => l, (r) => r), isA<UnexpectedFailure>());
        verify(() => mockRemote.fetchMoteis(page)).called(1);
        verifyNoMoreInteractions(mockRemote);
      });
    });

    group("Quando não há conexão com a internet", () {
      test("Deve retornar uma [NoInternetConnection] quando o Não houver conexão", () async {
        // Arrage
        int page = 1;
        when(() => mockNetworkInfo.hasConnection).thenAnswer((_) async => false);

        // act
        final result = await repository.fetchMoteis(page);

        // Asset
        expect(result, isA<Left>());
        expect(result.fold((l) => l, (r) => r), isA<NoInternetConnection>());
        verifyNever(() => mockRemote.fetchMoteis(page));
      });
    });
  });
}
