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

  @override
  List<Object?> get props =>
      [fantasia, logo, bairro, distancia, qtdFavoritos, qtdAvaliacoes, media, suites];
}
