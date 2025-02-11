import 'package:dartz/dartz.dart';
import 'package:guia_moteis_desafio/modules/core/utils/failure.dart';
import 'package:guia_moteis_desafio/modules/core/utils/usecase.dart';
import 'package:guia_moteis_desafio/modules/moteis/domain/entities/motel.dart';
import 'package:guia_moteis_desafio/modules/moteis/domain/repositories/moteis_repository.dart';

class FetchMoteisUsecase implements Usecase<List<Motel>, Unit> {
  final MoteisRepository repositories;

  // Para controle de paginação (Não necessario na APi mock fornecido)
  int _currentPage = 1;
  bool _isLastPage = false;

  FetchMoteisUsecase({required this.repositories});

  @override
  Future<Either<Failure, List<Motel>>> call(Unit _) async {
    if (!_isLastPage) {
      final result = await repositories.fetchMoteis(_currentPage);
      result.fold((failure) {}, (moteis) {
        if (moteis.isEmpty) {
          _isLastPage = true;
        } else {
          _currentPage++;
        }
      });
      return result;
    } else {
      return Right([]);
    }
  }
}
