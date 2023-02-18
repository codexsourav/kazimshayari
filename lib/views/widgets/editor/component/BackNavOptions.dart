import 'package:flutter/material.dart';

Widget BackNavOptions({back, task}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: back,
          padding: EdgeInsets.all(5),
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 19,
          ),
          tooltip: "Back",
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text('$task'),
        ),
      ],
    ),
  );
}
