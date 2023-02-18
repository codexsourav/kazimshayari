import 'package:flutter/material.dart';
import 'package:kazimshayari/views/pages/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Quotes',
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
      ),
      home: const HomePage(),
    );
  }
}
