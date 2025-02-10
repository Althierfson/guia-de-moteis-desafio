import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis_desafio/modules/core/utils/failure.dart';
import 'package:guia_moteis_desafio/modules/moteis/domain/entities/motel.dart';
import 'package:guia_moteis_desafio/modules/moteis/domain/repositories/moteis_repository.dart';
import 'package:guia_moteis_desafio/modules/moteis/domain/usecases/fetch_moteis_usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks/mocks_data.dart';

class MockMoteisRepository extends Mock implements MoteisRepository {}

void main() {
  late MockMoteisRepository mock;
  late FetchMoteisUsecase usecase;

  setUp(() async {
    mock = MockMoteisRepository();
    usecase = FetchMoteisUsecase(repositories: mock);
  });

  test("Deve retorna uma lista de [Motel] em caso de sucesso", () async {
    // Arrage
    int page = 1;
    Right<Failure, List<Motel>> moteis = Right([MockData.motelMock.toEntity()]);
    when(() => mock.fetchMoteis(page)).thenAnswer((_) async => moteis);
    when(() => mock.fetchMoteis(page)).thenAnswer((_) async => moteis);

    // act
    final result = await usecase(unit);

    // Assert
    expect(moteis, result);
    verify(() => mock.fetchMoteis(page)).called(1);
    verifyNoMoreInteractions(mock);
  });

  test("Deve retorna uma lista de [Motel] e depois um lista vazia quando a page muda", () async {
    // Arrage
    int page1 = 1;
    int page2 = 2;
    Right<Failure, List<Motel>> moteis = Right([MockData.motelMock.toEntity()]);
    Right<Failure, List<Motel>> moteisEmpty = Right([]);
    when(() => mock.fetchMoteis(page1)).thenAnswer((_) async => moteis);
    when(() => mock.fetchMoteis(page2)).thenAnswer((_) async => moteisEmpty);

    // act
    final result1 = await usecase(unit);
    final result2 = await usecase(unit);

    // Assert
    expect(moteis, result1);
    expect(moteisEmpty, result2);
  });

  test("Deve retornar um [Failure] em caso de falhas", () async {
    // Arrage
    int page = 1;
    Left<Failure, List<Motel>> failure = Left(UnexpectedFailure());
    when(() => mock.fetchMoteis(page)).thenAnswer((_) async => failure);

    // act
    final result = await usecase(unit);

    // Assert
    expect(failure, result);
    verify(() => mock.fetchMoteis(page)).called(1);
    verifyNoMoreInteractions(mock);
  });
}
