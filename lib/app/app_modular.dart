import 'package:flutter_modular/flutter_modular.dart';
import 'package:guia_moteis_desafio/modules/core/core_module.dart';
import 'package:guia_moteis_desafio/modules/moteis/gonow_module.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module("/", module: GonowModule());
  }

  @override
  List<Module> get imports => [CoreModule()];
}
