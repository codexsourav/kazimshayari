import 'package:flutter/material.dart';
import 'package:kazimshayari/constents/Links.dart';
import 'package:kazimshayari/constents/themeColors.dart';
import 'package:kazimshayari/views/pages/EditorPage.dart';
import 'package:kazimshayari/views/pages/Tabs/FevouritePage.dart';
import 'package:kazimshayari/views/pages/Tabs/HomeShayaris.dart';
import 'package:kazimshayari/views/pages/Tabs/PageNames.dart';
import 'package:kazimshayari/views/pages/Tabs/ShowCategory.dart';
import 'package:kazimshayari/views/widgets/appbars/AppDrawer.dart';
import 'package:kazimshayari/views/widgets/appbars/HomeAppbar.dart';
import 'package:kazimshayari/views/widgets/components/BottamNavBar.dart';
import 'package:kazimshayari/views/widgets/editor/Editor.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tabindex = 0;
// bottam tab index set
  ontabSet(index) {
    if (index == 2) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => EditorPage(),
        ),
      );
    } else {
      setState(() {
        tabindex = index;
      });
    }
  }

// allt abes
  List<Widget> tabPages = [
    const HomeShayaris(),
    const ShowCategory(),
    const Editor(),
    const FevouritePage(),
  ];

// will pop on apage
  Future<bool> willTryPop() async {
    // page is desain so not back
    if (tabindex != 0) {
      setState(() {
        tabindex = 0;
      });
      return false;
    } else {
      return true;
    }
  }

// Drawer Handel click
  onclickDrawer(index) {
    setState(() {
      tabindex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    configOneSigal();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: willTryPop,
      child: Scaffold(
        appBar: HomeAppbar(titleWdg: pageNames[tabindex]),
        backgroundColor: Themecolors.graybg,
        // main body: ,
        body: tabPages[tabindex],
        bottomNavigationBar: BottamNavBar(onclick: ontabSet, index: tabindex),
        // app side drawer
        drawer: AppDrawer(
          context,
          tabindex: tabindex,
          onclick: onclickDrawer,
        ),
      ),
    );
  }

  // config one signal
  configOneSigal() async {
    await OneSignal.shared.setAppId(oneSignalId);
    OneSignal.shared.setNotificationWillShowInForegroundHandler((event) {
      OSNotificationDisplayType.notification;
    });
  }
}
