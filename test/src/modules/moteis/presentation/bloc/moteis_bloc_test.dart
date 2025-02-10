import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis_desafio/modules/core/utils/failure.dart';
import 'package:guia_moteis_desafio/modules/moteis/domain/usecases/fetch_moteis_usecase.dart';
import 'package:guia_moteis_desafio/modules/moteis/presentation/bloc/moteis_bloc.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks/mocks_data.dart';

class MockFetchMoteisUsecase extends Mock implements FetchMoteisUsecase {}

void main() {
  late MockFetchMoteisUsecase mockFetchMoteisUsecase;
  late MoteisBloc bloc;

  setUp(() {
    mockFetchMoteisUsecase = MockFetchMoteisUsecase();
    bloc = MoteisBloc(fetchMoteisUsecase: mockFetchMoteisUsecase);
  });

  // test("Deve lançar o estado [FetchMoteisSuccessMoteisState] quando o use case retornar uma lista",
  //     () async {
  //   // Arrage
  //   final expectedResult = [MockData.motelMock.toEntity()];
  //   when(() => mockFetchMoteisUsecase(unit)).thenAnswer((_) async => Right(expectedResult));

  //   // act
  //   bloc.add(FetchMoteisEvent());

  //   // Asset
  //   expect(bloc.state, order([LoadingMoteisState(),]))
  // });

  group("FetchMoteisEvent", () {
    blocTest(
      'Deve lançar o estado [FetchMoteisSuccessMoteisState] quando o use case retornar uma lista',
      setUp: () {
        when(() => mockFetchMoteisUsecase(unit))
            .thenAnswer((_) async => Right([MockData.motelMock.toEntity()]));
      },
      build: () => bloc,
      act: (bloc) => bloc.add(FetchMoteisEvent()),
      expect: () => [
        LoadingMoteisState(),
        FetchMoteisSuccessMoteisState(moteis: [MockData.motelMock.toEntity()])
      ],
    );

    blocTest(
      'Deve lançar o estado [FetchMoteisFailureMoteisState] quando o use case retornar uma falha',
      setUp: () {
        when(() => mockFetchMoteisUsecase(unit)).thenAnswer((_) async => Left(ServerFailure()));
      },
      build: () => bloc,
      act: (bloc) => bloc.add(FetchMoteisEvent()),
      expect: () =>
          [LoadingMoteisState(), FetchMoteisFailureMoteisState(message: ServerFailure().message)],
    );
  });

  group("FetchMoreMoteisEvent", () {
    blocTest(
      'Deve lançar o estado [FetchMoteisSuccessMoteisState] quando o use case retornar uma lista',
      setUp: () {
        when(() => mockFetchMoteisUsecase(unit))
            .thenAnswer((_) async => Right([MockData.motelMock.toEntity()]));
      },
      build: () => bloc,
      act: (bloc) => bloc.add(FetchMoreMoteisEvent()),
      expect: () => [
        FetchMoteisSuccessMoteisState(moteis: [MockData.motelMock.toEntity()])
      ],
    );

    blocTest(
      'Deve lançar o estado [FetchMoteisNoMoreItensMoteisState] quando o use case retornar uma lista vazia',
      setUp: () {
        when(() => mockFetchMoteisUsecase(unit)).thenAnswer((_) async => Right([]));
      },
      build: () => bloc,
      act: (bloc) => bloc.add(FetchMoreMoteisEvent()),
      expect: () => [FetchMoteisNoMoreItensMoteisState()],
    );

    blocTest(
      'Deve lançar o estado [FetchMoreMoteisFailureMoteisState] quando o use case retornar uma falha',
      setUp: () {
        when(() => mockFetchMoteisUsecase(unit)).thenAnswer((_) async => Left(ServerFailure()));
      },
      build: () => bloc,
      act: (bloc) => bloc.add(FetchMoreMoteisEvent()),
      expect: () => [FetchMoreMoteisFailureMoteisState(message: ServerFailure().message)],
    );
  });
}
