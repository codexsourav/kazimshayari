import 'package:flutter/material.dart';

import 'package:kazimshayari/views/widgets/editor/constents/Images.dart';

Widget setBgImg({ontap}) {
  return GridView.count(
    crossAxisCount: 3,
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    mainAxisSpacing: 0,
    padding: EdgeInsets.all(10),
    children: List.generate(
      ImagesPath.length,
      (index) => GestureDetector(
        onTap: () {
          ontap(index);
        },
        child: Container(
          color: Colors.transparent,
          padding: EdgeInsets.all(5),
          child: Image.asset(
            ImagesPath[index],
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
  );
}
