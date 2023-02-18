import 'package:flutter/material.dart';
import 'package:kazimshayari/constents/themeColors.dart';

SnackBar MysnackBar(text) {
  return SnackBar(
    backgroundColor: Themecolors.primary,
    content: Text('$text'),
  );
}
