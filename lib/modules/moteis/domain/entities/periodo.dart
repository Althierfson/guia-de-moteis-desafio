import 'package:equatable/equatable.dart';
import 'package:guia_moteis_desafio/modules/moteis/domain/entities/desconto.dart';

class Periodo extends Equatable {
  final String tempoFormatado;
  final String tempo;
  final double valor;
  final double valorTotal;
  final bool temCortesia;
  final Desconto? desconto;

  const Periodo({
    required this.tempoFormatado,
    required this.tempo,
    required this.valor,
    required this.valorTotal,
    required this.temCortesia,
    this.desconto,
  });

  double get descontoPorcente => (desconto!.desconto * 100 / valor);

  @override
  List<Object?> get props => [tempoFormatado, tempo, valor, valorTotal, temCortesia, desconto];
}
