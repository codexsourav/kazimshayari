import 'package:flutter/material.dart';
import 'package:kazimshayari/constents/themeColors.dart';

Widget TextEditor({text, onsave}) {
  TextEditingController textEditingController =
      TextEditingController(text: text);
  return Dialog(
    elevation: 0.0,
    child: Container(
      height: 280.0,
      width: 380.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'Edit Quote',
            style: TextStyle(
              color: Themecolors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 19,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            padding: EdgeInsets.all(10),
            color: Color.fromARGB(255, 235, 235, 235),
            child: TextField(
              controller: textEditingController,
              cursorColor: Themecolors.primary,
              keyboardType: TextInputType.multiline,
              maxLines: 6,
              decoration: const InputDecoration.collapsed(hintText: ''),
            ),
          ),
          GestureDetector(
            onTap: () {
              onsave(textEditingController.text);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              decoration: BoxDecoration(
                color: Themecolors.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Update Quote',
                style: TextStyle(color: Themecolors.white),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
