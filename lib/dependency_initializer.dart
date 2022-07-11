import 'package:solid_software_test_project/data/repositories/states_repository.dart';
import 'package:solid_software_test_project/main.dart';
import 'package:solid_software_test_project/providers/states_provider.dart';

class DependencyInitializer {
  DependencyInitializer._();

  static void initDependencies() {
    injector

      //Providers
      ..registerLazySingleton<StatesProvider>(StatesProvider.new)

      //Repositories
      ..registerLazySingleton<StatesRepository>(StatesRepository.new);
  }
}
