
import 'package:flutter/material.dart';

class MainButtomNavigation extends StatelessWidget {
  const MainButtomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/main/home.png')), label: 'Home'),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/main/results.png')), label: 'Results'),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/main/drills.png')), label: 'Drills'),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/main/me.png')), label: 'Me'),
      ],
    onTap:(int index){
       switch(index){
         case 0: Navigator.pushNamed(context, '/mainfeed');
          break;
         case 1: Navigator.pushNamed(context, '/results');
         break;
         case 2: Navigator.pushNamed(context, '/drills');
         break;
         case 3: Navigator.pushNamed(context, '/me');
         break;
       }
    }
    );
  }
}
