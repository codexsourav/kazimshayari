import 'package:flutter/material.dart';
import 'package:kazimshayari/views/widgets/shayaribox/ShayariView.dart';

Widget showFav(data) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 50),
      child: Column(
        children: List.generate(data.length, (index) {
          return ShayariView(
            quotes: data[index],
          );
        }),
      ),
    ),
  );
}
