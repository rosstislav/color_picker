import 'package:flutter/material.dart';
import 'package:solid_software_test_project/pages/select_state_page/select_state_page.dart';
import 'package:solid_software_test_project/pages/select_state_page/select_state_page_arguments.dart';

class StatePage extends StatefulWidget {
  const StatePage({Key? key}) : super(key: key);

  static const routeName = '/state_page';

  @override
  State<StatePage> createState() => _StatePageState();
}

class _StatePageState extends State<StatePage> {
  String? _state;
  SelectStatePageArguments? _arg;

  @override
  Widget build(BuildContext context) {
    _arg ??=
        ModalRoute.of(context)!.settings.arguments as SelectStatePageArguments?;
    return Scaffold(
      appBar: AppBar(
        title: const Text('State page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _getState,
                child: const Text('Select state'),
              ),
              const SizedBox(height: 30),
              Text(_state != null
                  ? 'Your state: $_state'
                  : 'You have not selected a state')
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _getState() async {
    final result = await Navigator.of(context, rootNavigator: true).pushNamed(
      SelectStatePage.routeName,
      arguments: SelectStatePageArguments(_state ?? ''),
    ) as String?;
    if (result != null) {
      setState(() {
        _state = result;
      });
    }
  }
}
