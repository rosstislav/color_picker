part of 'states_bloc.dart';

abstract class StatesState extends Equatable {
  const StatesState();

  @override
  List<Object?> get props => [];
}

class StatesInitial extends StatesState {
  @override
  List<Object> get props => [];
}

class StatesLoadedState extends StatesState {
  const StatesLoadedState(this.states);

  final List<StateModel> states;

  @override
  List<Object?> get props => [states];
}

class SearchedStates extends StatesState {
  const SearchedStates(this.states);

  final List<StateModel> states;

  @override
  List<Object?> get props => [states];
}

class GotArgumentState extends StatesState {}
