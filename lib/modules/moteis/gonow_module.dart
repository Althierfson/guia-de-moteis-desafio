import 'package:flutter_modular/flutter_modular.dart';
import 'package:guia_moteis_desafio/modules/core/core_module.dart';
import 'package:guia_moteis_desafio/modules/moteis/domain/repositories/moteis_repository.dart';
import 'package:guia_moteis_desafio/modules/moteis/domain/usecases/fetch_moteis_usecase.dart';
import 'package:guia_moteis_desafio/modules/moteis/ext/datasources/moteis_local_datasource_impl.dart';
import 'package:guia_moteis_desafio/modules/moteis/ext/datasources/moteis_remote_datasource_impl.dart';
import 'package:guia_moteis_desafio/modules/moteis/infra/datasources/moteis_local_datasource.dart';
import 'package:guia_moteis_desafio/modules/moteis/infra/datasources/moteis_remote_datasource.dart';
import 'package:guia_moteis_desafio/modules/moteis/infra/repositories/moteis_repository_impl.dart';
import 'package:guia_moteis_desafio/modules/moteis/presentation/bloc/moteis_bloc.dart';
import 'package:guia_moteis_desafio/modules/moteis/presentation/pages/moteis_home_page.dart';

class GonowModule extends Module {
  @override
  void binds(Injector i) {
    super.binds(i);

    i.addLazySingleton<MoteisRemoteDatasource>(() => MoteisRemoteDatasourceImpl(client: i.get()));
    i.addLazySingleton<MoteisLocalDatasource>(() => MoteisLocalDatasourceImpl(database: i.get()));

    i.addLazySingleton<MoteisRepository>(() => MoteisRepositoryImpl(
        localDatasource: i.get(), remoteDatasource: i.get(), networkInfo: i.get()));

    i.addLazySingleton(() => FetchMoteisUsecase(repositories: i.get()));

    i.add(() => MoteisBloc(fetchMoteisUsecase: i.get()));
  }

  @override
  void routes(RouteManager r) {
    super.routes(r);

    r.child("/", child: (_) => MoteisHomePage());
  }

  @override
  List<Module> get imports => [CoreModule()];
}
