import 'package:flutter/material.dart';
import 'package:kazimshayari/constents/themeColors.dart';
import 'package:kazimshayari/views/widgets/components/AppcategoryBtn.dart';

Widget FinalButton(context, {onclick, loading}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
    child: !loading
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppcategoryBtn(context,
                  title: 'Save', active: true, onclick: () => onclick(0)),
              AppcategoryBtn(context,
                  title: 'Share', active: true, onclick: () => onclick(1)),
            ],
          )
        : CircularProgressIndicator(
            color: Themecolors.primary,
          ),
  );
}
