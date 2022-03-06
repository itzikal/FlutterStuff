import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'MainButtomNavigation.dart';
class MainFeedScreen extends StatefulWidget {
  const MainFeedScreen({Key? key}) : super(key: key);

  @override
  State<MainFeedScreen> createState() => _MainFeedScreenState();
}

class _MainFeedScreenState extends State<MainFeedScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    _prefs.then((SharedPreferences prefs) {
      prefs.setString("token", "dasdada");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: MainButtomNavigation(),
body:    Container(child: Text('MainFeed'),));
  }
}
