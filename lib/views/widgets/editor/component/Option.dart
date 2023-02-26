import 'package:flutter/material.dart';
import 'package:kazimshayari/constents/themeColors.dart';

Widget Options(
    {IconData icon = Icons.format_size_sharp,
    String text = 'Title',
    onclick,
    index = 0}) {
  return GestureDetector(
    onTap: () => onclick(index),
    child: ClipRRect(
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
              size: 20,
            ),
            const SizedBox(height: 4),
            Text(
              text,
              style: const TextStyle(fontSize: 7),
            )
          ],
        )),
      ),
    ),
  );
}
