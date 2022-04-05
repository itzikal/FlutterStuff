import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {

    _prefs.then((SharedPreferences prefs) {
      // var token = prefs.getString('token');
      Navigator.pop(context);
      // if(token == null){
        Navigator.pushNamed(context, '/onbording');
      // }else{
      //   Navigator.pushNamed(context, '/main');
      // }
    });

    super.initState();
    // Timer(Duration(milliseconds: 2000), (){
    // Navigator.pushNamed(context, '/onbording');});
  }
  @override
  Widget build(BuildContext context) {
    return Image(image: AssetImage('assets/splase.png'));
  }
}
