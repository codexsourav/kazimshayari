import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kazimshayari/constents/themeColors.dart';
import 'package:kazimshayari/views/pages/AllCategorys.dart';
import 'package:kazimshayari/views/pages/EditorPage.dart';
import 'package:url_launcher/url_launcher.dart';

Drawer AppDrawer(context, {tabindex, onclick}) {
  return Drawer(
    child: Column(
      children: [
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color: Themecolors.primary,
          ),
          accountName: const Text(
            'Welcome To',
            style: TextStyle(fontSize: 10),
          ),
          accountEmail: const Text(
            'Daily Quotes',
            style: TextStyle(fontSize: 20),
          ),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: Image.asset(
              'assets/images/icon.png',
              width: 30,
              height: 30,
            ),
          ),
        ),
        ListTile(
          selected: tabindex == 0,
          selectedColor: Themecolors.primary,
          leading: const Icon(
            FontAwesomeIcons.home,
            size: 18,
          ),
          title: const Text('Home'),
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 15,
          ),
          onTap: () {
            Navigator.of(context).pop();
            onclick(0);
          },
        ),
        ListTile(
          selected: tabindex == 1,
          selectedColor: Themecolors.primary,
          leading: const Icon(
            FontAwesomeIcons.boxes,
            size: 18,
          ),
          title: const Text('Categories'),
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 15,
          ),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AllCategorys(),
              ),
            );
          },
        ),
        ListTile(
          selected: tabindex == 2,
          selectedColor: Themecolors.primary,
          leading: const Icon(
            FontAwesomeIcons.paintRoller,
            size: 18,
          ),
          title: const Text('Make Design'),
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 15,
          ),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => EditorPage(),
              ),
            );
          },
        ),
        ListTile(
          selected: tabindex == 3,
          selectedColor: Themecolors.primary,
          leading: const Icon(
            FontAwesomeIcons.solidHeart,
            size: 18,
          ),
          title: const Text('Your Favorite'),
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 15,
          ),
          onTap: () {
            Navigator.of(context).pop();
            onclick(3);
          },
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ListTile(
              leading: const Icon(
                FontAwesomeIcons.instagram,
                color: Colors.pink,
                size: 18,
              ),
              title: const Text('Follow Me Instagram'),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15,
              ),
              onTap: () async {
                const url = "https://www.instagram.com/codexsourav";
                final Uri url0 = Uri.parse(url);
                await launchUrl(url0, mode: LaunchMode.externalApplication);
              },
            ),
          ),
        ),
      ],
    ),
  );
}
