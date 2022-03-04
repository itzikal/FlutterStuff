import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test_drive/screens/get_started_screen.dart';

class WelcomeAnimationScreen extends StatefulWidget {
  const WelcomeAnimationScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeAnimationScreen> createState() => WelcomeAnimationState();
}

class WelcomeAnimationState extends State<WelcomeAnimationScreen> {
  int count = 0;
  double opacityLevel = 0.0;
  int duration = 3000;
  String welcomeText = "Welcome to the Game";
  bool inAnimation = false;

  void _changeOpacity(int level) {
    setState(() {
      if (level == 1) {
        opacityLevel = 1.0;
        duration = 3000;
      } else {
        opacityLevel = 0.0;
        duration = 200;
      }
    });
  }

  void setWelcomeText() {
    if (count == 0) {
      // _changeOpacity(0);
      setState(() => welcomeText = "1111");
      _changeOpacity(1);
      count = count + 1;
    }else if(count == 1){
      count = count + 1;
      _changeOpacity(0);
      setState(() => welcomeText = "2222");
      _changeOpacity(1);
    }else{
      nextPage();
    }
  }

  void nextPage() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => GetStaredScreen()));
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //onAnimationEnded();
  }

  void onAnimationEnded(){
    if(inAnimation){
      _changeOpacity(0);
    }
    else{
      setWelcomeText();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/welcome_red_image.png'),
                          fit: BoxFit.cover),
                    ),
                    child: SafeArea(

                    child: Center(
                      child:
                      InkWell(
                         onTap: nextPage,
                        child: Stack(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisSize: MainAxisSize.max,
                            // mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                           Padding(
                              padding: const EdgeInsets.all(28.0),
                              child: Text(welcomeText,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 42,
                                      fontFamily: 'oswald_bold',
                                      color: Colors.white,
                                      shadows: [
                                        Shadow(
                                            offset: Offset(0.5, 0.5),
                                            blurRadius: 2.0,
                                            color: Colors.black)
                                      ])),
                            ),

                              Positioned(child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Image(image: AssetImage('assets/welcome_coach.png'))))]),))),
                    ));
  }
}
