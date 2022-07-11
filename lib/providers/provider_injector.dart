import 'package:solid_software_test_project/main.dart';
import 'package:solid_software_test_project/providers/states_provider.dart';

class ProviderInjector {
  ProviderInjector._();

  static final ProviderInjector instance = ProviderInjector._();

  StatesProvider get states => injector<StatesProvider>();
}
