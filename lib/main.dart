import 'package:flutter/material.dart';
import 'package:flutter_test_drive/screens/DrillsScreen.dart';
import 'package:flutter_test_drive/screens/MainFeedScreen.dart';
import 'package:flutter_test_drive/screens/MeSceen.dart';
import 'package:flutter_test_drive/screens/ResultsScreen.dart';
import 'package:flutter_test_drive/screens/SplashScreen.dart';
import 'package:flutter_test_drive/screens/get_started_screen.dart';
import 'screens/welcome_animation_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // initializeJsonMapper();
    // initializeReflectable();
    return MaterialApp(
      routes: {
        '/':(context) => SplashScreen(),
        '/onbording':(context) => WelcomeAnimationScreen(),
        '/getStarted':(context) => GetStaredScreen(),
        '/mainfeed':(context) => MainFeedScreen(),
        '/drills':(context) => DrillsScreen(),
        '/results':(context) => ResultsScreen(),
        '/me':(context) => MeScreen(),
      },
        initialRoute: '/',
        );
  }
}
