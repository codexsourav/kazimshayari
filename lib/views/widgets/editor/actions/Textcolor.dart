import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

Widget TextColorSet({onchenge, color}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: ColorPicker(
          pickersEnabled: {
            ColorPickerType.both: false,
            ColorPickerType.wheel: true,
            ColorPickerType.accent: false,
          },
          color: color,
          onColorChanged: (value) => onchenge(value),
        ),
      ),
    ],
  );
}
