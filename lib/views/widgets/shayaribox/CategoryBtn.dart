import 'package:flutter/material.dart';
import 'package:kazimshayari/constents/GredentColors.dart';
import 'package:kazimshayari/views/pages/CatView.dart';

Widget CategoryBtn(context, text) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CatView(cnmae: text),
        ),
      );
    },
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(
          10,
        ),
        gradient: getGcolor(),
      ),
      child: Center(
        child: Text(
          '$text',
          maxLines: 1,
          textAlign: TextAlign.center,
          overflow: TextOverflow.clip,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
