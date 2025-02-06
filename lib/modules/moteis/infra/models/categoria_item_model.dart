import 'package:guia_moteis_desafio/modules/moteis/domain/entities/categoria_item.dart';

class CategoriaItemModel {
  String nome;
  String icone;

  CategoriaItemModel({
    required this.nome,
    required this.icone,
  });

  factory CategoriaItemModel.fromJson(Map<String, dynamic> json) => CategoriaItemModel(
        nome: json["nome"],
        icone: json["icone"],
      );

  Map<String, dynamic> toJson() => {
        "nome": nome,
        "icone": icone,
      };

  factory CategoriaItemModel.fromEntity(CategoriaItem entity) => CategoriaItemModel(
        nome: entity.nome,
        icone: entity.icone,
      );

  CategoriaItem toEntity() => CategoriaItem(
        nome: nome,
        icone: icone,
      );
}
