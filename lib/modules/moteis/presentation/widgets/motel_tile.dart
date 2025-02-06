import 'package:flutter/material.dart';
import 'package:guia_moteis_desafio/modules/moteis/domain/entities/motel.dart';
import 'package:guia_moteis_desafio/modules/moteis/presentation/widgets/suite_tile.dart';

class MotelTile extends StatefulWidget {
  final Motel motel;
  const MotelTile({super.key, required this.motel});

  @override
  State<MotelTile> createState() => _MotelTileState();
}

class _MotelTileState extends State<MotelTile> {
  late Motel _motel;

  @override
  void initState() {
    _motel = widget.motel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                ClipOval(
                  child: SizedBox(
                      height: 80,
                      width: 80,
                      child: Image.network(
                        _motel.logo,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(90),
                            ),
                          );
                        },
                      )),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _motel.fantasia,
                      style: TextStyle(fontSize: 22),
                    ),
                    Text(_motel.bairro),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 5, right: 7),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.lightGreen),
                              borderRadius: BorderRadius.all(Radius.circular(6.0))),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.lightGreen,
                                size: 15,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                _motel.media.toString(),
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              Text(
                                "${_motel.qtdAvaliacoes} avaliações",
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                              Icon(Icons.keyboard_arrow_down)
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const Spacer(),
                Icon(
                  Icons.favorite,
                  size: 30,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                  _motel.suites.length,
                  (index) => Padding(
                        padding: EdgeInsets.only(left: index == 0 ? 20.0 : 7.0),
                        child: SuiteTile(suite: _motel.suites[index]),
                      )),
            ),
          )
        ],
      ),
    );
  }
}
