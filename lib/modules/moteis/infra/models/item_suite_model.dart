import 'package:guia_moteis_desafio/modules/moteis/domain/entities/item_suite.dart';

class ItemSuiteModel {
  String nome;

  ItemSuiteModel({required this.nome});

  factory ItemSuiteModel.fromJson(Map<String, dynamic> json) => ItemSuiteModel(
        nome: json["nome"],
      );

  Map<String, dynamic> toJson() => {
        "nome": nome,
      };

  factory ItemSuiteModel.fromEntity(ItemSuite entity) => ItemSuiteModel(
        nome: entity.nome,
      );

  ItemSuite toEntity() => ItemSuite(
        nome: nome,
      );
}
