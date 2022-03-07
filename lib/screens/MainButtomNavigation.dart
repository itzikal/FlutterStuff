import 'package:flutter/material.dart';

class Testing {
  int value;

  Testing(this.value);
}

class MainButtomNavigation extends StatefulWidget {
  final Function(int) onCountChanged;

  MainButtomNavigation(this.onCountChanged);

  @override
  State<MainButtomNavigation> createState() => _MainButtomNavigationState();
}

class _MainButtomNavigationState extends State<MainButtomNavigation> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/main/home.png')), label: 'Home'),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/main/results.png')),
            label: 'Results'),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/main/drills.png')),
            label: 'Drills'),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/main/me.png')), label: 'Me'),
      ],
     currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.black,
      showUnselectedLabels: true,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });

        widget.onCountChanged(index);
      },
      // (int index){
      //  switch(index){
      //    case 0: Navigator.pushNamed(context, '/mainfeed');
      //     break;
      //    case 1: Navigator.pushNamed(context, '/results');
      //    break;
      //    case 2: Navigator.pushNamed(context, '/drills');
      //    break;
      //    case 3: Navigator.pushNamed(context, '/me');
      //    break;
      //  }

      // }
    );
  }
}
