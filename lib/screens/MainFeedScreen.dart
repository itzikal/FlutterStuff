import 'package:flutter/material.dart';
import 'MainButtomNavigation.dart';
class MainFeedScreen extends StatelessWidget {
  const MainFeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: MainButtomNavigation(),
body:
    Container(child: Text('MainFeed'),));
  }
}
