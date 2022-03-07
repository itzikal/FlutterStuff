import 'package:flutter/material.dart';
import 'package:flutter_test_drive/screens/MainButtomNavigation.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({Key? key}) : super(key: key);

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // bottomNavigationBar: MainButtomNavigation(),
      child: Text("Results screen "),
    );
  }
}
