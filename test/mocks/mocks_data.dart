import 'package:guia_moteis_desafio/modules/moteis/infra/models/categoria_item_model.dart';
import 'package:guia_moteis_desafio/modules/moteis/infra/models/desconto_model.dart';
import 'package:guia_moteis_desafio/modules/moteis/infra/models/item_suite_model.dart';
import 'package:guia_moteis_desafio/modules/moteis/infra/models/motel_model.dart';
import 'package:guia_moteis_desafio/modules/moteis/infra/models/periodo_model.dart';
import 'package:guia_moteis_desafio/modules/moteis/infra/models/suites_model.dart';

class MockData {
  static MotelModel get motelMock => MotelModel(
        fantasia: "Motel Paraíso",
        logo: "https://example.com/logo.png",
        bairro: "Centro",
        distancia: 2.5,
        qtdFavoritos: 120,
        qtdAvaliacoes: 45,
        media: 4.8,
        suites: [suiteMock1, suiteMock2],
      );

  static SuiteModel get suiteMock1 => SuiteModel(
        nome: "Suíte Luxo",
        qtd: 5,
        exibirQtdDisponiveis: true,
        fotos: [
          "https://example.com/suite1-1.jpg",
          "https://example.com/suite1-2.jpg"
        ],
        itens: [itemSuiteMock1, itemSuiteMock2],
        categoriaItens: [categoriaItemMock1],
        periodos: [periodoMock1, periodoMock2],
      );

  static SuiteModel get suiteMock2 => SuiteModel(
        nome: "Suíte Standard",
        qtd: 3,
        exibirQtdDisponiveis: false,
        fotos: [
          "https://example.com/suite2-1.jpg",
          "https://example.com/suite2-2.jpg"
        ],
        itens: [itemSuiteMock1],
        categoriaItens: [categoriaItemMock2],
        periodos: [periodoMock1],
      );

  static ItemSuiteModel get itemSuiteMock1 => ItemSuiteModel(
        nome: "Hidromassagem",
      );

  static ItemSuiteModel get itemSuiteMock2 => ItemSuiteModel(
        nome: "TV 4K",
      );

  static CategoriaItemModel get categoriaItemMock1 => CategoriaItemModel(
        nome: "Lazer",
        icone: "spa_icon",
      );

  static CategoriaItemModel get categoriaItemMock2 => CategoriaItemModel(
        nome: "Tecnologia",
        icone: "tv_icon",
      );

  static PeriodoModel get periodoMock1 => PeriodoModel(
        tempoFormatado: "2 horas",
        tempo: "120min",
        valor: 150.00,
        valorTotal: 150.00,
        temCortesia: false,
        desconto: descontoMock,
      );

  static PeriodoModel get periodoMock2 => PeriodoModel(
        tempoFormatado: "Pernoite",
        tempo: "8h",
        valor: 300.00,
        valorTotal: 270.00,
        temCortesia: true,
        desconto: descontoMock,
      );

  static DescontoModel get descontoMock => DescontoModel(
        desconto: 10
      );
}
