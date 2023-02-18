import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

Widget TextColorSet({onchenge, color}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: ColorPicker(
          pickerColor: color,
          portraitOnly: true,
          showLabel: false,
          onColorChanged: (value) => onchenge(value),
        ),
      ),
    ],
  );
}
