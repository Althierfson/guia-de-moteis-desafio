import 'package:dartz/dartz.dart';
import 'package:guia_moteis_desafio/modules/core/network/network_info.dart';
import 'package:guia_moteis_desafio/modules/core/utils/failure.dart';
import 'package:guia_moteis_desafio/modules/moteis/domain/entities/motel.dart';
import 'package:guia_moteis_desafio/modules/moteis/domain/repositories/moteis_repository.dart';
import 'package:guia_moteis_desafio/modules/moteis/infra/datasources/moteis_local_datasource.dart';
import 'package:guia_moteis_desafio/modules/moteis/infra/datasources/moteis_remote_datasource.dart';
import 'package:guia_moteis_desafio/utils/custom_debug_print.dart';

class MoteisRepositoryImpl implements MoteisRepository {
  final MoteisRemoteDatasource remoteDatasource;
  final MoteisLocalDatasource localDatasource;
  final NetworkInfo networkInfo;

  MoteisRepositoryImpl({
    required this.remoteDatasource,
    required this.localDatasource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Motel>>> fetchMoteis(int page) async {
    try {
      if (await networkInfo.hasConnection) {
        final motels = await remoteDatasource.fetchMoteis(page);
        await localDatasource.saveMoteis(motels);
        return Right(motels.map((e) => e.toEntity()).toList());
      } else {
        final motels = await localDatasource.fetchMoteis();
        return Right(motels.map((e) => e.toEntity()).toList());
      }
    } on Failure catch (failure) {
      if (failure is LocalDatabaseFailure) {
        return Right([]);
      }
      
      return Left(failure);
    } catch (e) {
      customDebugPrint(e.toString(), label: "MotelsRepositoryImpl.fetchMotels");
      return Left(UnexpectedFailure());
    }
  }
}
