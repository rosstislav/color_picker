part of 'states_bloc.dart';

abstract class StatesEvent extends Equatable {
  const StatesEvent();

  @override
  List<Object?> get props => [];
}

class LoadStatesEvent extends StatesEvent {}

class SearchStatesEvent extends StatesEvent {
  const SearchStatesEvent(this.query);

  final String query;
}

class GetArgumentEvent extends StatesEvent {}
