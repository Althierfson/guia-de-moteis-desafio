import 'package:equatable/equatable.dart';
import 'package:guia_moteis_desafio/modules/moteis/domain/entities/categoria_item.dart';
import 'package:guia_moteis_desafio/modules/moteis/domain/entities/item_suite.dart';
import 'package:guia_moteis_desafio/modules/moteis/domain/entities/periodo.dart';

class Suite extends Equatable {
  final String nome;
  final int qtd;
  final bool exibirQtdDisponiveis;
  final List<String> fotos;
  final List<ItemSuite> itens;
  final List<CategoriaItem> categoriaItens;
  final List<Periodo> periodos;

  const Suite({
    required this.nome,
    required this.qtd,
    required this.exibirQtdDisponiveis,
    required this.fotos,
    required this.itens,
    required this.categoriaItens,
    required this.periodos,
  });

  @override
  List<Object?> get props =>
      [nome, qtd, exibirQtdDisponiveis, fotos, itens, categoriaItens, periodos];
}
