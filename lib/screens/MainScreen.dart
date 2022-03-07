import 'package:flutter/material.dart';
import 'package:flutter_test_drive/screens/DrillsScreen.dart';
import 'package:flutter_test_drive/screens/MainFeedScreen.dart';
import 'package:flutter_test_drive/screens/MeSceen.dart';
import 'package:flutter_test_drive/screens/ResultsScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'MainButtomNavigation.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Widget _body = MainFeedScreen();

  @override
  void initState() {
    _prefs.then((SharedPreferences prefs) {
      prefs.setString("token", "dasdada");
    });
    super.initState();
  }

  void onButtonBarChanged(int index) {
    setState(() {
      switch (index) {
        case 0:
          _body = MainFeedScreen();
          break;
        case 1:
          _body = ResultsScreen();
          break;
        case 2:
          _body = DrillsScreen();
          break;
        case 3:
          _body = MeScreen();
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: MainButtomNavigation(onButtonBarChanged),
        body: SafeArea(child: _body));
  }
}
