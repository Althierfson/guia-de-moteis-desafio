part of 'moteis_bloc.dart';

abstract class MoteisState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingMoteisState extends MoteisState {}

class FetchMoteisSuccessMoteisState extends MoteisState {
  final List<Motel> moteis;

  FetchMoteisSuccessMoteisState({required this.moteis});

  @override
  List<Object?> get props => [moteis];
}

class FetchMoteisFailureMoteisState extends MoteisState {
  final String message;

  FetchMoteisFailureMoteisState({required this.message});

  @override
  List<Object?> get props => [message];
}

class FetchMoreMoteisFailureMoteisState extends MoteisState {
  final String message;

  FetchMoreMoteisFailureMoteisState({required this.message});

  @override
  List<Object?> get props => [message];
}

class FetchMoteisNoMoreItensMoteisState extends MoteisState {}