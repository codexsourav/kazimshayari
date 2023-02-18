import 'package:flutter/material.dart';
import 'package:kazimshayari/constents/themeColors.dart';

Widget SetOpacity({onchenge, size}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Slider(
          value: size,
          max: 1,
          min: 0,
          thumbColor: Themecolors.primary,
          inactiveColor: Colors.white,
          activeColor: Themecolors.primary,
          onChanged: (value) {
            onchenge(value);
          },
        ),
      ),
    ],
  );
}
