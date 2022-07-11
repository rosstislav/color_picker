import 'package:solid_software_test_project/data/models/state_model/state_model.dart';
import 'package:solid_software_test_project/data/repositories/states_repository.dart';
import 'package:solid_software_test_project/main.dart';

class StatesProvider {
  StatesRepository get repository => injector<StatesRepository>();

  Future<List<StateModel>> getStates() => repository.getStates();
}
