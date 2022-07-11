import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:solid_software_test_project/dependency_initializer.dart';
import 'package:solid_software_test_project/pages/home_page/home_page.dart';
import 'package:solid_software_test_project/pages/select_state_page/bloc/states_bloc.dart';
import 'package:solid_software_test_project/pages/select_state_page/select_state_page.dart';
import 'package:solid_software_test_project/pages/state_page/state_page.dart';

final injector = GetIt.instance;

void main() {
  DependencyInitializer.initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<StatesBloc>(
          create: (BuildContext context) => StatesBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName: (context) => const HomePage(),
          SelectStatePage.routeName: (context) => const SelectStatePage(),
          StatePage.routeName: (context) => const StatePage(),
        },
      ),
    );
  }
}
