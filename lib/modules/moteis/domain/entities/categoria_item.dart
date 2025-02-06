import 'package:equatable/equatable.dart';

class CategoriaItem extends Equatable {
  final String nome;
  final String icone;

  const CategoriaItem({required this.nome, required this.icone});

  @override
  List<Object?> get props => [nome, icone];
}
