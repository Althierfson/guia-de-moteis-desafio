import 'package:equatable/equatable.dart';
import 'package:guia_moteis_desafio/modules/moteis/domain/entities/suite.dart';

class Motel extends Equatable {
  final String fantasia;
  final String logo;
  final String bairro;
  final double distancia;
  final int qtdFavoritos;
  final int qtdAvaliacoes;
  final double media;
  final List<Suite> suites;

  const Motel({
    required this.fantasia,
    required this.logo,
    required this.bairro,
    required this.distancia,
    required this.qtdFavoritos,
    required this.qtdAvaliacoes,
    required this.media,
    required this.suites,
  });

  double get melhorSuiteDesconto {
    double bestDesconto = 0;
    for (var suite in suites) {
      for (var periodo in suite.periodos) {
        if (periodo.desconto != null) {
          if (periodo.descontoPorcente > bestDesconto) {
            bestDesconto = periodo.descontoPorcente;
          }
        }
      }
    }
    return bestDesconto;
  }

  double get precoDamelhorSuiteDesconto {
    double bestDesconto = 0;
    double preco = 0;
    for (var suite in suites) {
      for (var periodo in suite.periodos) {
        if (periodo.desconto != null) {
          if (periodo.descontoPorcente > bestDesconto) {
            bestDesconto = periodo.descontoPorcente;
            preco = periodo.valorTotal;
          }
        }
      }
    }
    return preco;
  }

  @override
  List<Object?> get props =>
      [fantasia, logo, bairro, distancia, qtdFavoritos, qtdAvaliacoes, media, suites];
}
