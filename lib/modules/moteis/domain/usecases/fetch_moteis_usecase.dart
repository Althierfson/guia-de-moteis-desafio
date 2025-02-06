import 'package:dartz/dartz.dart';
import 'package:guia_moteis_desafio/modules/core/utils/failure.dart';
import 'package:guia_moteis_desafio/modules/core/utils/usecase.dart';
import 'package:guia_moteis_desafio/modules/moteis/domain/entities/motel.dart';
import 'package:guia_moteis_desafio/modules/moteis/domain/repositories/moteis_repository.dart';

class FetchMoteisUsecase implements Usecase<List<Motel>, Unit> {
  final MoteisRepository repositories;

  // Para controle de paginação (Não utilizado no mock)
  int _currentPage = 1;
  bool _isLasPage = false;

  FetchMoteisUsecase({required this.repositories});

  @override
  Future<Either<Failure, List<Motel>>> call(Unit _) async {
    if (!_isLasPage) {
      final result = await repositories.fetchMoteis(_currentPage);
      result.fold((failure) {}, (moteis) {
        if (moteis.isEmpty) {
          _isLasPage = true;
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
