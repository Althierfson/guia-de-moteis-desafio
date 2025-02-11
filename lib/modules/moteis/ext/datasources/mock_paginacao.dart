import 'package:guia_moteis_desafio/modules/moteis/infra/models/categoria_item_model.dart';
import 'package:guia_moteis_desafio/modules/moteis/infra/models/desconto_model.dart';
import 'package:guia_moteis_desafio/modules/moteis/infra/models/item_suite_model.dart';
import 'package:guia_moteis_desafio/modules/moteis/infra/models/motel_model.dart';
import 'package:guia_moteis_desafio/modules/moteis/infra/models/periodo_model.dart';
import 'package:guia_moteis_desafio/modules/moteis/infra/models/suites_model.dart';

List<MotelModel> page2 = [
  MotelModel(
    fantasia: "Queen's Motel",
    logo:
        "https://cdn.guiademoteis.com.br/Images/moteis/76-Queens-Motel/logo-grande/Queens-Motel-logo-grande.jpg",
    bairro: "Aeroporto - São Paulo",
    distancia: 2.5,
    qtdFavoritos: 120,
    qtdAvaliacoes: 45,
    media: 4.8,
    suites: [
      SuiteModel(
        nome: "Suíte Luxo",
        qtd: 5,
        exibirQtdDisponiveis: true,
        fotos: [
          "https://cdn.guiademoteis.com.br/Images/moteis/76-Queens-Motel/suites/345-Luxo/fotos/cf71a2c3-20cc-491b-8a5a-7304db3c17d9-suites.jpg",
          "https://example.com/suite1-2.jpg"
        ],
        itens: [
          ItemSuiteModel(nome: "Hidromassagem"),
          ItemSuiteModel(nome: "TV 4K"),
        ],
        categoriaItens: [
          CategoriaItemModel(
              nome: "Frigobar",
              icone:
                  "https://cdn.guiademoteis.com.br/Images/itens-suites/frigobar-04-09-2018-12-14.png"),
          CategoriaItemModel(
              nome: "Ar-Condicionado",
              icone:
                  "https://cdn.guiademoteis.com.br/Images/itens-suites/arcondicionado-04-09-2018-12-13.png"),
        ],
        periodos: [
          PeriodoModel(
            tempoFormatado: "2 horas",
            tempo: "120min",
            valor: 150.00,
            valorTotal: 150.00,
            temCortesia: false,
            desconto: DescontoModel(desconto: 10),
          ),
        ],
      ),
    ],
  ),
  MotelModel(
    fantasia: "Deslumbre",
    logo:
        "https://cdn.guiademoteis.com.br/Images/moteis/207-Deslumbre/logo-grande/2e92c41a-609b-41f3-af73-cace05214a2c-logo-grande.jpg",
    bairro: "Interlagos - São Paulo",
    distancia: 3.8,
    qtdFavoritos: 95,
    qtdAvaliacoes: 30,
    media: 4.5,
    suites: [
      SuiteModel(
        nome: "Suíte Romântica",
        qtd: 4,
        exibirQtdDisponiveis: true,
        fotos: [
          "https://cdn.guiademoteis.com.br/Images/moteis/207-Deslumbre/suites/15946-Classic/fotos/1209fcd8-5a08-4c28-8b6f-bd73fd8835c7-suites.jpg",
          "https://example.com/suite3-2.jpg"
        ],
        itens: [
          ItemSuiteModel(nome: "Cama King Size"),
          ItemSuiteModel(nome: "Iluminação LED"),
        ],
        categoriaItens: [
          CategoriaItemModel(
              nome: "Internet Wi-Fi",
              icone:
                  "https://cdn.guiademoteis.com.br/Images/itens-suites/internet-wifi-22-08-2018-11-42.png"),
          CategoriaItemModel(
              nome: "Secador de Cabelo",
              icone:
                  "https://cdn.guiademoteis.com.br/Images/itens-suites/secador-de-cabelo-04-09-2018-12-14.png"),
        ],
        periodos: [
          PeriodoModel(
            tempoFormatado: "3 horas",
            tempo: "180min",
            valor: 200.00,
            valorTotal: 180.00,
            temCortesia: true,
            desconto: DescontoModel(desconto: 10),
          ),
        ],
      ),
    ],
  ),
];

List<MotelModel> page3 = [
  MotelModel(
    fantasia: "Motel Elegance",
    logo: "https://cdn.guiademoteis.com.br/imagens/logotipos/443-elegance.gif",
    bairro: "Vila mariana - São paulo",
    distancia: 5.2,
    qtdFavoritos: 200,
    qtdAvaliacoes: 80,
    media: 4.9,
    suites: [
      SuiteModel(
        nome: "Suíte Master",
        qtd: 6,
        exibirQtdDisponiveis: true,
        fotos: [
          "https://cdn.guiademoteis.com.br/Images/moteis/443-Motel-Elegance/suites/14974-Simples/fotos/262f16c5-a6d7-4964-91b0-7f0b8f947dff-suites.jpg",
          "https://example.com/suite4-2.jpg"
        ],
        itens: [
          ItemSuiteModel(nome: "Piscina Privativa"),
          ItemSuiteModel(nome: "Sistema de Som"),
        ],
        categoriaItens: [
          CategoriaItemModel(
              nome: "Internet Wi-Fi",
              icone:
                  "https://cdn.guiademoteis.com.br/Images/itens-suites/internet-wifi-22-08-2018-11-42.png"),
          CategoriaItemModel(
              nome: "Secador de Cabelo",
              icone:
                  "https://cdn.guiademoteis.com.br/Images/itens-suites/secador-de-cabelo-04-09-2018-12-14.png"),
          CategoriaItemModel(
              nome: "Frigobar",
              icone:
                  "https://cdn.guiademoteis.com.br/Images/itens-suites/frigobar-04-09-2018-12-14.png"),
          CategoriaItemModel(
              nome: "Ar-Condicionado",
              icone:
                  "https://cdn.guiademoteis.com.br/Images/itens-suites/arcondicionado-04-09-2018-12-13.png"),
        ],
        periodos: [
          PeriodoModel(
            tempoFormatado: "2 horas",
            tempo: "120min",
            valor: 220.00,
            valorTotal: 200.00,
            temCortesia: true,
            desconto: DescontoModel(desconto: 10),
          ),
        ],
      ),
    ],
  ),
  MotelModel(
    fantasia: "Intense Motel",
    logo:
        "https://cdn.guiademoteis.com.br/Images/moteis/2115-Intense-Motel/logo-grande/Intense-Motel-logo-grande.jpg",
    bairro: "Interlagos - São Paulo",
    distancia: 4.0,
    qtdFavoritos: 150,
    qtdAvaliacoes: 60,
    media: 4.7,
    suites: [
      SuiteModel(
        nome: "Suíte VIP",
        qtd: 3,
        exibirQtdDisponiveis: false,
        fotos: [
          "https://cdn.guiademoteis.com.br/Images/moteis/2115-Intense-Motel/suites/9718-Imaginarium/fotos/b5c4c304-b002-46c6-a5d1-ca4bb4b7faa9-suites.jpg",
          "https://example.com/suite5-2.jpg"
        ],
        itens: [
          ItemSuiteModel(nome: "Banheira de Hidromassagem"),
          ItemSuiteModel(nome: "Varanda com Vista Panorâmica"),
        ],
        categoriaItens: [
          CategoriaItemModel(
              nome: "Internet Wi-Fi",
              icone:
                  "https://cdn.guiademoteis.com.br/Images/itens-suites/internet-wifi-22-08-2018-11-42.png"),
          CategoriaItemModel(
              nome: "Frigobar",
              icone:
                  "https://cdn.guiademoteis.com.br/Images/itens-suites/frigobar-04-09-2018-12-14.png"),
          CategoriaItemModel(
              nome: "Ar-Condicionado",
              icone:
                  "https://cdn.guiademoteis.com.br/Images/itens-suites/arcondicionado-04-09-2018-12-13.png"),
        ],
        periodos: [
          PeriodoModel(
            tempoFormatado: "Pernoite",
            tempo: "8h",
            valor: 350.00,
            valorTotal: 320.00,
            temCortesia: true,
            desconto: DescontoModel(desconto: 10),
          ),
        ],
      ),
    ],
  ),
];

List<MotelModel> page4 = [];

List<List<MotelModel>> pageResponse = [page2, page3, page4];
