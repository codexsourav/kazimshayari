import 'package:flutter/material.dart';
import 'package:kazimshayari/views/widgets/editor/constents/Fonts.dart';
import 'package:kazimshayari/constents/themeColors.dart';

Widget setFonts({ontap}) {
  return Column(
    children: List.generate(
        AppFonts.length,
        (index) => GestureDetector(
              onTap: () {
                ontap(index);
              },
              child: Container(
                color: Colors.transparent,
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Text(
                  AppFonts[index].toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Themecolors.primary,
                    fontSize: 22,
                    fontFamily: AppFonts[index].toString(),
                  ),
                ),
              ),
            )),
  );
}
