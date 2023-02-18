import 'package:flutter/material.dart';
import 'package:kazimshayari/constents/themeColors.dart';

Widget Options(
    {IconData icon = Icons.format_size_sharp,
    String text = 'Title',
    onclick,
    index = 0}) {
  return GestureDetector(
    onTap: () => onclick(index),
    child: Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
          color: Themecolors.white, borderRadius: BorderRadius.circular(10)),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Themecolors.primary,
            size: 24,
          ),
          SizedBox(height: 8),
          Text(
            text,
            style: TextStyle(fontSize: 8),
          )
        ],
      )),
    ),
  );
}
