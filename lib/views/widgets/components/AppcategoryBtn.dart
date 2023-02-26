import 'package:flutter/material.dart';
import 'package:kazimshayari/constents/themeColors.dart';

Widget AppcategoryBtn(context, {active = false, title = 'Category', onclick}) {
  return GestureDetector(
    onTap: onclick,
    child: Container(
      width: (MediaQuery.of(context).size.width / 3) - 20,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      height: 40,
      decoration: BoxDecoration(
        color: active ? Themecolors.primary : Themecolors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Themecolors.primary),
      ),
      child: Center(
        child: Text(
          '$title',
          maxLines: 1,
          overflow: TextOverflow.clip,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: active ? Themecolors.white : Themecolors.primary,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    ),
  );
}
