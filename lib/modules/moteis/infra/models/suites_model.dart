import 'package:equatable/equatable.dart';
import 'package:guia_moteis_desafio/modules/moteis/domain/entities/suite.dart';
import 'package:guia_moteis_desafio/modules/moteis/infra/models/categoria_item_model.dart';
import 'package:guia_moteis_desafio/modules/moteis/infra/models/item_suite_model.dart';
import 'package:guia_moteis_desafio/modules/moteis/infra/models/periodo_model.dart';

class SuiteModel extends Equatable {
  final String nome;
  final int qtd;
  final bool exibirQtdDisponiveis;
  final List<String> fotos;
  final List<ItemSuiteModel> itens;
  final List<CategoriaItemModel> categoriaItens;
  final List<PeriodoModel> periodos;

  const SuiteModel({
    required this.nome,
    required this.qtd,
    required this.exibirQtdDisponiveis,
    required this.fotos,
    required this.itens,
    required this.categoriaItens,
    required this.periodos,
  });

  factory SuiteModel.fromJson(Map<String, dynamic> json) => SuiteModel(
        nome: json["nome"],
        qtd: json["qtd"],
        exibirQtdDisponiveis: json["exibirQtdDisponiveis"],
        fotos: List<String>.from(json["fotos"].map((x) => x)),
        itens: List<ItemSuiteModel>.from(json["itens"].map((x) => ItemSuiteModel.fromJson(x))),
        categoriaItens: List<CategoriaItemModel>.from(
            json["categoriaItens"].map((x) => CategoriaItemModel.fromJson(x))),
        periodos: List<PeriodoModel>.from(json["periodos"].map((x) => PeriodoModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nome": nome,
        "qtd": qtd,
        "exibirQtdDisponiveis": exibirQtdDisponiveis,
        "fotos": List<dynamic>.from(fotos.map((x) => x)),
        "itens": List<dynamic>.from(itens.map((x) => x.toJson())),
        "categoriaItens": List<dynamic>.from(categoriaItens.map((x) => x.toJson())),
        "periodos": List<dynamic>.from(periodos.map((x) => x.toJson())),
      };

  factory SuiteModel.fromEntity(Suite entity) => SuiteModel(
        nome: entity.nome,
        qtd: entity.qtd,
        exibirQtdDisponiveis: entity.exibirQtdDisponiveis,
        fotos: List<String>.from(entity.fotos),
        itens: entity.itens.map((x) => ItemSuiteModel.fromEntity(x)).toList(),
        categoriaItens: entity.categoriaItens.map((x) => CategoriaItemModel.fromEntity(x)).toList(),
        periodos: entity.periodos.map((x) => PeriodoModel.fromEntity(x)).toList(),
      );

  Suite toEntity() => Suite(
        nome: nome,
        qtd: qtd,
        exibirQtdDisponiveis: exibirQtdDisponiveis,
        fotos: List<String>.from(fotos),
        itens: itens.map((x) => x.toEntity()).toList(),
        categoriaItens: categoriaItens.map((x) => x.toEntity()).toList(),
        periodos: periodos.map((x) => x.toEntity()).toList(),
      );

  @override
  List<Object?> get props =>
      [nome, qtd, exibirQtdDisponiveis, fotos, itens, categoriaItens, periodos];
}
