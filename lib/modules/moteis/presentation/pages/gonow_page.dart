import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guia_moteis_desafio/modules/moteis/domain/entities/motel.dart';
import 'package:guia_moteis_desafio/modules/moteis/presentation/bloc/moteis_bloc.dart';
import 'package:guia_moteis_desafio/modules/moteis/presentation/widgets/motel_tile.dart';

class GonowPage extends StatefulWidget {
  final MoteisBloc bloc;
  const GonowPage({super.key, required this.bloc});

  @override
  State<GonowPage> createState() => _GonowPageState();
}

class _GonowPageState extends State<GonowPage> {
  late MoteisBloc _bloc;

  final ScrollController _scrollController = ScrollController();

  List<String> enderecos = ["Zona sul", "Zona Norte", "Zona Oeste", "Zona Leste"];
  String? selectEndereco;

  Set<Motel> moteis = {};

  bool canFetchMoreMoteis = true;

  @override
  void initState() {
    _bloc = widget.bloc;
    _bloc.add(FetchMoteisEvent());
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  void _onScroll() {
    if (canFetchMoreMoteis) {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 100) {
        _bloc.add(FetchMoreMoteisEvent());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffd60b0e),
      ),
      child: Column(
        children: [
          DropdownButton(
              value: enderecos.first,
              items: enderecos.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (value) {
                selectEndereco = value;
              }),
          Expanded(
            child: BlocBuilder(
              bloc: _bloc,
              builder: (context, state) {
                if (state is LoadingMoteisState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is FetchMoteisFailureMoteisState) {
                  return Center(
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 100,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(state.message)
                        ],
                      ),
                    ),
                  );
                }

                Widget lastItem = Center(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: CircularProgressIndicator(),
                  ),
                );

                if (state is FetchMoreMoteisFailureMoteisState) {
                  lastItem = Center(
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 100,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(state.message)
                        ],
                      ),
                    ),
                  );
                }

                if (state is FetchMoteisNoMoreItensMoteisState) {
                  canFetchMoreMoteis = false;
                  lastItem = SizedBox(
                    height: 20,
                  );
                }

                if (state is FetchMoteisSuccessMoteisState) {
                  moteis.addAll(state.moteis);
                }

                return Container(
                  decoration: BoxDecoration(
                      color: const Color(0xfff2f0f0),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0))),
                  child: ListView.builder(
                      controller: _scrollController,
                      itemCount: moteis.length + 1,
                      itemBuilder: (context, index) {
                        if (index == moteis.length) {
                          return lastItem;
                        }

                        return MotelTile(motel: moteis.elementAt(index));
                      }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
