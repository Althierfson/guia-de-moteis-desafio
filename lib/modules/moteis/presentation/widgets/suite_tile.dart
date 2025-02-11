import 'package:flutter/material.dart';
import 'package:guia_moteis_desafio/modules/moteis/domain/entities/suite.dart';

class SuiteTile extends StatelessWidget {
  final Suite suite;
  const SuiteTile({super.key, required this.suite});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 300,
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Column(
            children: [
              SizedBox(
                  width: 300,
                  height: 200,
                  child: Image.network(
                    suite.fotos.first,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Color(0xfff2f0f0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      );
                    },
                  )),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 300,
                child: Text(
                  suite.nome,
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.fade,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              if (suite.exibirQtdDisponiveis)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.emergency,
                      color: Colors.red,
                      size: 12,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "só mais ${suite.qtd} pelo app",
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    )
                  ],
                )
              else
                SizedBox(
                  height: 17,
                )
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          width: 300,
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                suite.categoriaItens.length > 4 ? 5 : suite.categoriaItens.length + 1, (index) {
              if (index == 4 || index == suite.categoriaItens.length) {
                return Row(
                  children: [
                    Text(
                      "Ver\ntodos",
                      style: TextStyle(
                          fontSize: 10, color: Color(0xffa19d9d), fontWeight: FontWeight.bold),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 10,
                    )
                  ],
                );
              }

              return Container(
                height: 45,
                width: 45,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5), color: Color(0xfff2f0f0)),
                child: Image.network(
                  suite.categoriaItens[index].icone,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Color(0xfff2f0f0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    );
                  },
                ),
              );
            }),
          ),
        ),
        Column(
          children: List.generate(
              suite.periodos.length,
              (index) => Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Container(
                      width: 300,
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          color: Colors.white, borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    suite.periodos[index].tempoFormatado,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  if (suite.periodos[index].desconto != null)
                                    Container(
                                      padding: const EdgeInsets.only(left: 10, right: 10),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Color(0xffa19d9d)),
                                          borderRadius: BorderRadius.circular(15)),
                                      child: Text(
                                        "${suite.periodos[index].descontoPorcente.toStringAsFixed(2).substring(0, 2)}% off",
                                        style: TextStyle(fontSize: 10, color: Color(0xffa19d9d)),
                                      ),
                                    )
                                ],
                              ),
                              Row(
                                children: [
                                  if (suite.periodos[index].desconto != null)
                                    Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: Text(
                                        "R\$ ${suite.periodos[index].valor.toString()}",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xffa19d9d),
                                            decoration: TextDecoration.lineThrough),
                                      ),
                                    ),
                                  Text(
                                    "R\$ ${suite.periodos[index].valorTotal.toString()}",
                                    style: TextStyle(fontSize: 16),
                                  )
                                ],
                              )
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xffa19d9d),
                              ))
                        ],
                      ),
                    ),
                  )),
        )
      ],
    );
  }
}
