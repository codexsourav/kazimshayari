import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kazimshayari/constents/themeColors.dart';

Widget BottamNavBar({onclick, index = 0}) {
  return BottomNavigationBar(
      onTap: (index) {
        onclick(index);
      },
      currentIndex: index,
      iconSize: 19.0,
      unselectedFontSize: 8,
      selectedFontSize: 8,
      unselectedItemColor: Themecolors.secendery,
      selectedItemColor: Themecolors.primary,
      type: BottomNavigationBarType.fixed,
      elevation: 0.0,
      items: const [
        BottomNavigationBarItem(
          label: ' Home',
          icon: Icon(FontAwesomeIcons.home),
        ),
        BottomNavigationBarItem(
          label: 'Categories',
          icon: Icon(FontAwesomeIcons.boxes),
        ),
        BottomNavigationBarItem(
          label: 'Design',
          icon: Icon(FontAwesomeIcons.paintRoller),
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.red,
          label: 'Favorite',
          icon: Icon(FontAwesomeIcons.solidHeart),
        ),
      ]);
}
