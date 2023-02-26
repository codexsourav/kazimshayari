import 'package:flutter/material.dart';
import 'package:kazimshayari/views/widgets/editor/component/actionBtn.dart';

Widget setBgGredentColor(context, {colors, setcolor}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 40),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        actionBtn(
          width: MediaQuery.of(context).size.width / 2 - 40,
          text: 'Sclect First Color',
          fontsize: 14,
          onclick: () => setcolor(0),
        ),
        actionBtn(
          width: MediaQuery.of(context).size.width / 2 - 40,
          text: 'Sclect Secend Color',
          fontsize: 13,
          onclick: () => setcolor(1),
        )
      ],
    ),
  );
}
