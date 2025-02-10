import 'package:equatable/equatable.dart';
import 'package:guia_moteis_desafio/modules/moteis/domain/entities/motel.dart';
import 'package:guia_moteis_desafio/modules/moteis/infra/models/suites_model.dart';

class MotelModel extends Equatable {
  final String fantasia;
  final String logo;
  final String bairro;
  final double distancia;
  final int qtdFavoritos;
  final int qtdAvaliacoes;
  final double media;
  final List<SuiteModel> suites;

  const MotelModel({
    required this.fantasia,
    required this.logo,
    required this.bairro,
    required this.distancia,
    required this.qtdFavoritos,
    required this.qtdAvaliacoes,
    required this.media,
    required this.suites,
  });

  factory MotelModel.fromJson(Map<String, dynamic> json) => MotelModel(
        fantasia: json["fantasia"],
        logo: json["logo"],
        bairro: json["bairro"],
        distancia: json["distancia"],
        qtdFavoritos: json["qtdFavoritos"],
        qtdAvaliacoes: json["qtdAvaliacoes"],
        media: json["media"],
        suites: List<SuiteModel>.from(json["suites"].map((x) => SuiteModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "fantasia": fantasia,
        "logo": logo,
        "bairro": bairro,
        "distancia": distancia,
        "qtdFavoritos": qtdFavoritos,
        "qtdAvaliacoes": qtdAvaliacoes,
        "media": media,
        "suites": List<dynamic>.from(suites.map((x) => x.toJson())),
      };

  factory MotelModel.fromEntity(Motel entity) => MotelModel(
        fantasia: entity.fantasia,
        logo: entity.logo,
        bairro: entity.bairro,
        distancia: entity.distancia,
        qtdFavoritos: entity.qtdFavoritos,
        qtdAvaliacoes: entity.qtdAvaliacoes,
        media: entity.media,
        suites: entity.suites.map((x) => SuiteModel.fromEntity(x)).toList(),
      );

  Motel toEntity() => Motel(
        fantasia: fantasia,
        logo: logo,
        bairro: bairro,
        distancia: distancia,
        qtdFavoritos: qtdFavoritos,
        qtdAvaliacoes: qtdAvaliacoes,
        media: media,
        suites: suites.map((x) => x.toEntity()).toList(),
      );

  @override
  List<Object?> get props =>
      [fantasia, logo, bairro, distancia, qtdFavoritos, qtdAvaliacoes, media, suites];
}
