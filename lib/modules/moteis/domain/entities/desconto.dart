import 'package:equatable/equatable.dart';

class Desconto extends Equatable {
  final double desconto;

  const Desconto({required this.desconto});

  @override
  List<Object?> get props => [desconto];
}
