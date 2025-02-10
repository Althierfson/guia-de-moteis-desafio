import 'package:equatable/equatable.dart';
import 'package:guia_moteis_desafio/modules/moteis/domain/entities/desconto.dart';

class DescontoModel extends Equatable {
  final double desconto;

  const DescontoModel({required this.desconto});

  factory DescontoModel.fromJson(Map<String, dynamic> json) =>
      DescontoModel(desconto: json["desconto"]);

  Map<String, dynamic> toJson() => {"desconto": desconto};

  factory DescontoModel.fromEntity(Desconto entity) => DescontoModel(desconto: entity.desconto);

  Desconto toEntity() => Desconto(desconto: desconto);

  @override
  List<Object?> get props => [desconto];
}
