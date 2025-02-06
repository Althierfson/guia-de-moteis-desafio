import 'package:guia_moteis_desafio/modules/moteis/domain/entities/periodo.dart';
import 'package:guia_moteis_desafio/modules/moteis/infra/models/desconto_model.dart';

class PeriodoModel {
  String tempoFormatado;
  String tempo;
  double valor;
  double valorTotal;
  bool temCortesia;
  DescontoModel? desconto;

  PeriodoModel({
    required this.tempoFormatado,
    required this.tempo,
    required this.valor,
    required this.valorTotal,
    required this.temCortesia,
    this.desconto,
  });

  factory PeriodoModel.fromJson(Map<String, dynamic> json) => PeriodoModel(
        tempoFormatado: json["tempoFormatado"],
        tempo: json["tempo"],
        valor: json["valor"],
        valorTotal: json["valorTotal"],
        temCortesia: json["temCortesia"],
        desconto: json["desconto"] != null ? DescontoModel.fromJson(json["desconto"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "tempoFormatado": tempoFormatado,
        "tempo": tempo,
        "valor": valor,
        "valorTotal": valorTotal,
        "temCortesia": temCortesia,
        "desconto": desconto?.toJson(),
      };

  factory PeriodoModel.fromEntity(Periodo entity) => PeriodoModel(
      tempoFormatado: entity.tempoFormatado,
      tempo: entity.tempo,
      valor: entity.valor,
      valorTotal: entity.valorTotal,
      temCortesia: entity.temCortesia,
      desconto: entity.desconto != null ? DescontoModel.fromEntity(entity.desconto!) : null);

  Periodo toEntity() => Periodo(
        tempoFormatado: tempoFormatado,
        tempo: tempo,
        valor: valor,
        valorTotal: valorTotal,
        temCortesia: temCortesia,
        desconto: desconto?.toEntity(),
      );
}
