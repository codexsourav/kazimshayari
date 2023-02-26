import 'package:flutter/material.dart';
import 'package:kazimshayari/constents/themeColors.dart';

import 'package:kazimshayari/views/widgets/editor/component/actionBtn.dart';

Widget FinalButton(context, {onclick, loading}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
    child: !loading
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              actionBtn(
                  width: MediaQuery.of(context).size.width / 2 - 70,
                  text: 'Save',
                  onclick: () => onclick(0),
                  icon: Icons.save),
              actionBtn(
                  width: MediaQuery.of(context).size.width / 2 - 70,
                  text: 'Share',
                  onclick: () => onclick(1),
                  icon: Icons.share),
            ],
          )
        : CircularProgressIndicator(
            color: Themecolors.primary,
          ),
  );
}
