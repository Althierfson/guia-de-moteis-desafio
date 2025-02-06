import 'package:dartz/dartz.dart';
import 'package:guia_moteis_desafio/modules/core/utils/failure.dart';

abstract class Usecase<R, P> {
  Future<Either<Failure, R>> call(P params);
}
