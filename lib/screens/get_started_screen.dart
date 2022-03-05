import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test_drive/screens/MainButtomNavigation.dart';
import 'package:flutter_test_drive/server/HttpWrapper.dart';

import 'MainFeedScreen.dart';

class GetStaredScreen extends StatelessWidget {
  const GetStaredScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/welcome_red_image.png'),
                        fit: BoxFit.cover),
                  ),
                  child: Center(
                    child:InkWell(
    onTap: () {
      HttpWrapper().getPlayer();
      Navigator.pop(context);
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MainFeedScreen()));
      },

    child: Text('Get Started',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 42,
                            fontFamily: 'oswald_bold',
                            color: Colors.white,
                            shadows: [Shadow(offset: Offset(0.5,0.5), blurRadius: 2.0, color: Colors.black)]
                        )),
                  ),
                )))));
  }
}
