import 'package:flutter/material.dart';

// IMPORT ICONS

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white38,
      backgroundColor: Colors.orange[200],
      onTap: (int idx) {
        switch (idx) {
          case 0:
            // si estás en el current
            break;
          case 1:
            // Este sería para acceder a la cámara
            Navigator.pushNamed(context, '/camera');
            break;
          case 2:
            // Este sería para acceder a la búsqueda
            Navigator.pushNamed(context, '/search');
            break;
        }
      },
      items: const [
        // HOME BUTTON
        BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.home,
              size: 20,
            ),
            label: 'Home'),
        //
        BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.camera,
              size: 20,
            ),
            label: 'Camera'),
        BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.search,
              size: 20,
            ),
            label: 'Search'),
      ],
    );
  }
}
