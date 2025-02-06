import 'package:dartz/dartz.dart';
import 'package:guia_moteis_desafio/modules/core/utils/failure.dart';
import 'package:guia_moteis_desafio/modules/moteis/domain/entities/motel.dart';

abstract class MoteisRepository {
  Future<Either<Failure, List<Motel>>> fetchMoteis(int page);
}
