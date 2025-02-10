import 'package:equatable/equatable.dart';
import 'package:guia_moteis_desafio/modules/moteis/domain/entities/item_suite.dart';

class ItemSuiteModel extends Equatable {
  final String nome;

  const ItemSuiteModel({required this.nome});

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

  @override
  List<Object?> get props => [nome];
}
