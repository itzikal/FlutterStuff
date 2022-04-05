import 'package:flutter/material.dart';
import 'package:flutter_test_drive/model/Player.dart';
import 'package:flutter_test_drive/server/HttpWrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'MainButtomNavigation.dart';
class MainFeedScreen extends StatefulWidget {
  const MainFeedScreen({Key? key}) : super(key: key);

  @override
  State<MainFeedScreen> createState() => _MainFeedScreenState();
}

class _MainFeedScreenState extends State<MainFeedScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Player? player;

  void updatePlayer() async{
    var player = await HttpWrapper().getPlayer();
    setState(() {
      this.player = player;
    });
  }
  @override
  void initState() {
    _prefs.then((SharedPreferences prefs) {
      prefs.setString("token", "dasdada");
    });
    updatePlayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Main page"),),
    body:Row(children: [
      Text("Hello ${player?.data?.firstName ?? ""}"),
      ElevatedButton(
        child: Text("Number Trivia"),
        onPressed: () => Navigator.pushNamed(context, '/numberTrivia')
      ),

    ],
          ));
  }
}
