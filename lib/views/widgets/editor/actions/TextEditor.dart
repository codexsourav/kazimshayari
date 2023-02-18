import 'package:flutter/material.dart';
import 'package:kazimshayari/constents/themeColors.dart';

Widget TextEditor({text, onsave}) {
  TextEditingController textEditingController =
      TextEditingController(text: text);
  return Dialog(
    elevation: 0.0,
    child: Container(
      height: 220.0,
      width: 360.0,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: textEditingController,
              cursorColor: Themecolors.primary,
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              decoration: const InputDecoration.collapsed(
                hintText: 'Edit Text',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {
                onsave(textEditingController.text);
              },
              child: Text(
                'SAVE',
                style: TextStyle(color: Themecolors.primary),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
