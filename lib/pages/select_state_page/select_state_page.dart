import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_software_test_project/data/models/state_model/state_model.dart';
import 'package:solid_software_test_project/generated/assets.dart';
import 'package:solid_software_test_project/pages/select_state_page/bloc/states_bloc.dart';
import 'package:solid_software_test_project/pages/select_state_page/select_state_page_arguments.dart';
import 'package:solid_software_test_project/widgets/appbar_with_search.dart';

class SelectStatePage extends StatefulWidget {
  const SelectStatePage({Key? key}) : super(key: key);

  static const routeName = '/select_state_page';

  @override
  State<SelectStatePage> createState() => _SelectStatePageState();
}

class _SelectStatePageState extends State<SelectStatePage> {
  List<StateModel> _statesList = [];
  String? _selectedState;
  Timer? _debounce;
  SelectStatePageArguments? _arg;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<StatesBloc>(context).add(LoadStatesEvent());
    BlocProvider.of<StatesBloc>(context).add(GetArgumentEvent());
    _statesList = BlocProvider.of<StatesBloc>(context).statesList;
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _arg ??=
        ModalRoute.of(context)?.settings.arguments as SelectStatePageArguments?;

    return Scaffold(
      appBar: AppBarWithSearch(
        appBarTitle: 'Choose State',
        filterSearchResults: _filterSearchResults,
        onSave: _onSave,
        pop: _onBack,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: BlocConsumer<StatesBloc, StatesState>(
          listener: (context, state) {
            if (state is StatesLoadedState) {
              _statesList = BlocProvider.of<StatesBloc>(context).statesList;
            } else if (state is SearchedStates) {
              _statesList = BlocProvider.of<StatesBloc>(context).searchList;
            } else if (state is GotArgumentState) {
              _selectedState = _arg?.stateCode;
            }
          },
          builder: (context, _) {
            return ListView.separated(
              itemCount: _statesList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_statesList[index].name),
                  trailing: _statesList[index].code == _selectedState
                      ? Image.asset(
                          Assets.assetsCheckmark,
                          width: 13,
                          height: 10,
                        )
                      : const SizedBox.shrink(),
                  onTap: () => _selectState(index),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
            );
          },
        ),
      ),
    );
  }

  void _onSave() {
    final selectedState = _selectedState;
    if (selectedState != null) {
      _statesList = BlocProvider.of<StatesBloc>(context).statesList;
      Navigator.pop(context, selectedState);
    } else {
      return;
    }
  }

  void _filterSearchResults(String query) {
    _debounce = Timer(const Duration(milliseconds: 500), () {
      BlocProvider.of<StatesBloc>(context).add(SearchStatesEvent(query));
    });
  }

  void _selectState(int index) {
    if (_selectedState != _statesList[index].code) {
      setState(() {
        _selectedState = _statesList[index].code;
      });
    } else {
      setState(() {
        _selectedState = null;
      });
    }
  }

  void _onBack() {
    _statesList = BlocProvider.of<StatesBloc>(context).statesList;
    Navigator.pop(context);
  }
}
