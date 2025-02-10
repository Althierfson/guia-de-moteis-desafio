import 'package:dartz/dartz.dart';
import 'package:guia_moteis_desafio/modules/core/network/network_info.dart';
import 'package:guia_moteis_desafio/modules/core/utils/failure.dart';
import 'package:guia_moteis_desafio/modules/moteis/domain/entities/motel.dart';
import 'package:guia_moteis_desafio/modules/moteis/domain/repositories/moteis_repository.dart';
import 'package:guia_moteis_desafio/modules/moteis/infra/datasources/moteis_remote_datasource.dart';
import 'package:guia_moteis_desafio/utils/custom_debug_print.dart';

class MoteisRepositoryImpl implements MoteisRepository {
  final MoteisRemoteDatasource remoteDatasource;
  final NetworkInfo networkInfo;

  MoteisRepositoryImpl({
    required this.remoteDatasource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Motel>>> fetchMoteis(int page) async {
    try {
      if (await networkInfo.hasConnection) {
        final motels = await remoteDatasource.fetchMoteis(page);
        return Right(motels.map((e) => e.toEntity()).toList());
      } else {
        return Left(NoInternetConnection());
      }
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      customDebugPrint(e.toString(), label: "MotelsRepositoryImpl.fetchMotels");
      return Left(UnexpectedFailure());
    }
  }
}
