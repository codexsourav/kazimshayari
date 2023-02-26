import 'package:flutter/material.dart';

TextStyle style = const TextStyle(
    color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18);

List pageNames = [
  Image.asset('assets/images/logo.png', height: 38),
  Text('Categories', style: style),
  Text('Make Design', style: style),
  Text('Your Favorite', style: style),
];
