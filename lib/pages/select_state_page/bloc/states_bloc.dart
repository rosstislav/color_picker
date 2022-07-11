import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:solid_software_test_project/data/models/state_model/state_model.dart';
import 'package:solid_software_test_project/providers/provider_injector.dart';

part 'states_event.dart';

part 'states_state.dart';

class StatesBloc extends Bloc<StatesEvent, StatesState> {
  StatesBloc() : super(StatesInitial()) {
    on<LoadStatesEvent>((event, emit) async => emit(await _loadStates()));
    on<SearchStatesEvent>(
      (event, emit) async => emit(await _searchStates(event)),
    );
    on<GetArgumentEvent>((_, emit) => emit(GotArgumentState()));
  }

  final _provider = ProviderInjector.instance.states;
  List<StateModel> statesList = [];
  List<StateModel> searchList = [];

  Future<StatesState> _loadStates() async =>
      await _provider.getStates().then((states) {
        statesList = states;

        return StatesLoadedState(states);
      });

  Future<StatesState> _searchStates(SearchStatesEvent event) async {
    searchList = event.query.isEmpty
        ? statesList
        : statesList
            .where((element) =>
                element.name.toLowerCase().contains(event.query.toLowerCase()))
            .toList();

    return SearchedStates(searchList);
  }
}
