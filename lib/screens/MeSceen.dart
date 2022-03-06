import 'package:flutter/material.dart';
import 'package:flutter_test_drive/screens/MainButtomNavigation.dart';
import 'package:flutter_test_drive/server/HttpWrapper.dart';

class MeScreen extends StatelessWidget {
  const MeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: MainButtomNavigation(),
        body:Container(child: ElevatedButton(
        child: Text("update"),
    onPressed: getPlayer,),));
  }

  void getPlayer() async{
    var player = await HttpWrapper().getVideos();
    print("Videos name: ${player?.data?.length ?? "unknown"}");
  }
}
