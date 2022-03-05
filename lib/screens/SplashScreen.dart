import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();
    Timer(Duration(milliseconds: 2000), (){
    Navigator.pushNamed(context, '/onbording');});
  }
  @override
  Widget build(BuildContext context) {
    return Image(image: AssetImage('assets/splase.png'));
  }
}
