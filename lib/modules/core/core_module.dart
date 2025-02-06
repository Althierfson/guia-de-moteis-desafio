import 'package:flutter_modular/flutter_modular.dart';
import 'package:guia_moteis_desafio/modules/core/api_client/api_client.dart';
import 'package:guia_moteis_desafio/modules/core/api_client/http_api_client.dart';
import 'package:guia_moteis_desafio/modules/core/database/database.dart';
import 'package:guia_moteis_desafio/modules/core/database/hive_database.dart';
import 'package:guia_moteis_desafio/modules/core/network/network_info.dart';
import 'package:http/http.dart' as http;

class CoreModule extends Module {
  @override
  void binds(Injector i) {
    super.binds(i);
    i.addLazySingleton(() => http.Client());

    i.addLazySingleton<Database>(() => HiveDatabase());

    i.addLazySingleton<NetworkInfo>(() => NetworkInfoImpl(client: i.get()));

    i.addLazySingleton<ApiClient>(
        () => HttpApiClient(client: i.get(), baseUrl: "https://www.jsonkeeper.com"));
  }
}
