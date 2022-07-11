import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solid_software_test_project/pages/color_picker_page/color_picker_page.dart';
import 'package:solid_software_test_project/pages/state_page/state_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _firstTabNavKey = GlobalKey<NavigatorState>();
  final _secondTabNavKey = GlobalKey<NavigatorState>();
  late final TabController _tabController;
  late final _listOfKeys = [
    _firstTabNavKey,
    _secondTabNavKey,
  ];

  //widgets in tabs
  late final List<Widget> _data = [
    CupertinoTabView(
      navigatorKey: _firstTabNavKey,
      builder: (BuildContext context) {
        return const ColorPickerPage();
      },
    ),
    CupertinoTabView(
      navigatorKey: _secondTabNavKey,
      builder: (BuildContext context) {
        return const StatePage();
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _popBack,
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.circle),
              label: 'Color Picker',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search),
              label: 'USA States',
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return _data[index];
        },
      ),
    );
  }

  Future<bool> _popBack() async {
    return !(await _listOfKeys[_tabController.index].currentState?.maybePop() ??
        false);
  }
}
