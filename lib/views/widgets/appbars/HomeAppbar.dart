import 'package:flutter/material.dart';
import 'package:kazimshayari/constents/themeColors.dart';

PreferredSizeWidget HomeAppbar({titleWdg = const Text('Home')}) {
  return AppBar(
    centerTitle: true,
    title: titleWdg,
    backgroundColor: Themecolors.primary,
    elevation: 0.0,
  );
}
