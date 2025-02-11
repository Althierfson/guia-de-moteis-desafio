import 'package:flutter/material.dart';
import 'package:guia_moteis_desafio/modules/moteis/domain/entities/motel.dart';
import 'package:guia_moteis_desafio/modules/moteis/presentation/widgets/smooth_indicator.dart';

class HighlightsMoteis extends SliverPersistentHeaderDelegate {
  @override
  final double minExtent;
  @override
  final double maxExtent;

  final List<Motel> moteis;

  HighlightsMoteis({required this.minExtent, required this.maxExtent, this.moteis = const []});

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Color(0xffe8e8e8),
      child: Column(
        children: [
          SizedBox(
            height: maxExtent - 20,
            child: PageView(controller: _controller, children: [
              for (int index = 0; index < moteis.length; index++)
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration:
                        BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Container(
                          width: 160,
                          height: maxExtent - 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  fit: BoxFit.fitHeight,
                                  image: NetworkImage(moteis[index].suites.first.fotos.first))),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "🔥",
                                  style: TextStyle(fontSize: 22),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      moteis[index].fantasia,
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      moteis[index].bairro,
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Container(
                              width: 180,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xff999ba1).withAlpha(10)),
                              alignment: Alignment.center,
                              child: Text(
                                "${moteis[index].melhorSuiteDesconto.toInt()}% de desconto",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff7d7f85),
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: 180,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xff999ba1).withAlpha(10)),
                              alignment: Alignment.center,
                              child: Text(
                                "a partir de R\$ ${moteis[index].precoDamelhorSuiteDesconto}",
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 180,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xff999ba1)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "reservar",
                                      style: TextStyle(
                                          color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                      size: 15,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
            ]),
          ),
          SmoothIndicator(
            controller: _controller,
            itemCount: moteis.length,
            indicatorSize: 6,
          )
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
