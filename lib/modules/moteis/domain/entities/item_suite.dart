import 'package:equatable/equatable.dart';

class ItemSuite extends Equatable {
  final String nome;

  const ItemSuite({required this.nome});

  @override
  List<Object?> get props => [nome];
}
