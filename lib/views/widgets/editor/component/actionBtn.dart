import 'package:flutter/material.dart';
import 'package:kazimshayari/constents/themeColors.dart';

Widget actionBtn(
    {onclick, text, icon, double width = 120, double fontsize = 17}) {
  return GestureDetector(
    onTap: onclick,
    child: ClipRRect(
      child: Container(
        decoration: BoxDecoration(
            color: Themecolors.primary,
            borderRadius: BorderRadius.circular(10)),
        height: 50,
        width: width,
        child: Row(
          mainAxisAlignment: icon != null
              ? MainAxisAlignment.spaceEvenly
              : MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon != null
                ? Icon(
                    icon,
                    color: Colors.white,
                    size: 20,
                  )
                : SizedBox(),
            Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.clip,
              style: TextStyle(
                color: Colors.white,
                fontSize: fontsize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
