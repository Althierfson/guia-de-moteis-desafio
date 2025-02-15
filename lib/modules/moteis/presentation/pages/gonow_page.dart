import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guia_moteis_desafio/modules/moteis/domain/entities/motel.dart';
import 'package:guia_moteis_desafio/modules/moteis/presentation/bloc/moteis_bloc.dart';
import 'package:guia_moteis_desafio/modules/moteis/presentation/widgets/dashed_line_painter.dart';
import 'package:guia_moteis_desafio/modules/moteis/presentation/widgets/filter_option_tile.dart';
import 'package:guia_moteis_desafio/modules/moteis/presentation/widgets/highlights_moteis.dart';
import 'package:guia_moteis_desafio/modules/moteis/presentation/widgets/motel_tile.dart';
import 'package:guia_moteis_desafio/modules/moteis/presentation/widgets/persistent_filter_header.dart';

class GonowPage extends StatefulWidget {
  final MoteisBloc bloc;
  const GonowPage({super.key, required this.bloc});

  @override
  State<GonowPage> createState() => _GonowPageState();
}

class _GonowPageState extends State<GonowPage> {
  late MoteisBloc _bloc;

  final ScrollController _scrollController = ScrollController();

  Set<Motel> moteis = {};
  Set<String> filterOptions = {};

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
        if (!_bloc.isLoadingMoreItens) {
          _bloc.add(FetchMoreMoteisEvent());
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Color(0xffd60b0e),
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: DropdownButton(
            style: TextStyle(color: Colors.white),
            iconDisabledColor: Colors.white,
            iconEnabledColor: Colors.white,
            icon: Icon(Icons.keyboard_arrow_down),
            value: "zona sul",
            underline: CustomPaint(
              painter: DashedLinePainter(color: Colors.white),
            ),
            items: ["zona sul"]
                .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                      style: TextStyle(color: Colors.white),
                    )))
                .toList(),
            onChanged: null,
            onTap: () {
              //
            },
          ),
        ),
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
                    color: Color(0xfff2f0f0),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 100,
                          color: Color(0xffd60b0e),
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
                  padding: EdgeInsets.only(bottom: 60, top: 10),
                  child: CircularProgressIndicator(),
                ),
              );

              if (state is FetchMoreMoteisFailureMoteisState) {
                lastItem = Center(
                  child: Container(
                    color: Color(0xfff2f0f0),
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
                filterOptions.addAll(state.itensFilter);
              }

              return CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverPersistentHeader(
                    pinned: false,
                    floating: false,
                    delegate:
                        HighlightsMoteis(minExtent: 230, maxExtent: 230, moteis: moteis.toList()),
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    floating: false,
                    delegate: PersistentFilterHeader(minExtent: 60, maxExtent: 60, filterOptions: [
                      FilterOptionTile(icon: Icons.tune, text: "Filtros"),
                      for (var filter in filterOptions) FilterOptionTile(text: filter),
                    ]),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if (index == moteis.length) {
                          return lastItem;
                        }
                        return MotelTile(motel: moteis.elementAt(index));
                      },
                      childCount: moteis.length + 1,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
