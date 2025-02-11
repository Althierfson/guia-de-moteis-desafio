import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:guia_moteis_desafio/modules/moteis/domain/entities/motel.dart';
import 'package:guia_moteis_desafio/modules/moteis/domain/usecases/fetch_moteis_usecase.dart';
import 'package:equatable/equatable.dart';

part 'moteis_state.dart';
part 'moteis_event.dart';

class MoteisBloc extends Bloc<MoteisEvent, MoteisState> {
  final FetchMoteisUsecase fetchMoteisUsecase;

  bool isLoadingMoreItens = false;

  MoteisBloc({required this.fetchMoteisUsecase}) : super(LoadingMoteisState()) {
    on<FetchMoteisEvent>((event, emit) async {
      emit(LoadingMoteisState());
      await fetchMoteisUsecase(unit).then((value) {
        value.fold(
          (failure) async {
            emit(FetchMoteisFailureMoteisState(message: failure.message));
          },
          (moteis) async {
            List<String> itens = _getItenFromSuite(moteis);
            emit(FetchMoteisSuccessMoteisState(moteis: moteis, itensFilter: itens));
          },
        );
      });
    });

    on<FetchMoreMoteisEvent>((event, emit) async {
      isLoadingMoreItens = true;
      await fetchMoteisUsecase(unit).then((value) {
        value.fold(
          (failure) async {
            emit(FetchMoreMoteisFailureMoteisState(message: failure.message));
          },
          (moteis) async {
            if (moteis.isEmpty) {
              emit(FetchMoteisNoMoreItensMoteisState());
            } else {
              List<String> itens = _getItenFromSuite(moteis);
              emit(FetchMoteisSuccessMoteisState(moteis: moteis, itensFilter: itens));
            }
          },
        );
      });
      isLoadingMoreItens = false;
    });
  }

  List<String> _getItenFromSuite(List<Motel> moteis) {
    Set<String> list = {};
    for (var motel in moteis) {
      for (var suite in motel.suites) {
        list.addAll(suite.itens.map((e) => e.nome));
      }
    }
    return list.toList();
  }
}
