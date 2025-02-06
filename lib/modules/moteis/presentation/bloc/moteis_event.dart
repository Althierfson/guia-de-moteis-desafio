part of 'moteis_bloc.dart';

abstract class MoteisEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchMoteisEvent extends MoteisEvent {}

class FetchMoreMoteisEvent extends MoteisEvent {}