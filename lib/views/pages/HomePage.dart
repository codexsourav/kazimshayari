import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kazimshayari/constents/themeColors.dart';
import 'package:kazimshayari/views/pages/AllCategorys.dart';
import 'package:kazimshayari/views/pages/EditorPage.dart';
import 'package:kazimshayari/views/pages/Tabs/FevouritePage.dart';
import 'package:kazimshayari/views/pages/Tabs/HomeShayaris.dart';
import 'package:kazimshayari/views/pages/Tabs/PageNames.dart';
import 'package:kazimshayari/views/pages/Tabs/ShowCategory.dart';
import 'package:kazimshayari/views/widgets/appbars/HomeAppbar.dart';
import 'package:kazimshayari/views/widgets/components/BottamNavBar.dart';
import 'package:kazimshayari/views/widgets/editor/Editor.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tabindex = 0;
// bottam tab index set
  ontabSet(index) {
    setState(() {
      tabindex = index;
    });
  }

// allt abes
  List<Widget> tabPages = [
    const HomeShayaris(),
    const ShowCategory(),
    const Editor(),
    const FevouritePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (tabindex != 0) {
          setState(() {
            tabindex = 0;
          });
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: HomeAppbar(titleWdg: PageNames[tabindex]),

        backgroundColor: Themecolors.graybg,
        // main body: ,
        body: tabPages[tabindex],
        bottomNavigationBar: BottamNavBar(onclick: ontabSet, index: tabindex),
        drawer: Drawer(
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
                  setState(() {
                    tabindex = 0;
                  });
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
                  setState(() {
                    tabindex = 3;
                  });
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
                      await launchUrl(url0,
                          mode: LaunchMode.externalApplication);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
