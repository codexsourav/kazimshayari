import 'package:flutter/material.dart';
import 'package:kazimshayari/constents/themeColors.dart';

import 'package:kazimshayari/views/pages/Tabs/ShowCategory.dart';

class AllCategorys extends StatelessWidget {
  const AllCategorys({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Themecolors.primary,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'All Categories',
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
      ),
      body: ShowCategory(),
    );
  }
}
