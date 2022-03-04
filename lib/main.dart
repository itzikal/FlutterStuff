import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test_drive/screens/DrillsScreen.dart';
import 'package:flutter_test_drive/screens/MainFeedScreen.dart';
import 'package:flutter_test_drive/screens/MeSceen.dart';
import 'package:flutter_test_drive/screens/get_started_screen.dart';
import 'package:flutter_test_drive/screens/MainButtomNavigation.dart';
import 'screens/welcome_animation_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/':(context) => WelcomeAnimationScreen(),
        '/getStarted':(context) => GetStaredScreen(),
        '/mainfeed':(context) => MainFeedScreen(),
        '/drills':(context) => DrillsScreen(),
        '/me':(context) => MeScreen(),
      },
        initialRoute: '/',
        );
  }
}
