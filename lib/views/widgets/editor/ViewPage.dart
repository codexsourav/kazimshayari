import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kazimshayari/views/widgets/editor/constents/Fonts.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

Widget Viewpage(
  context, {
  String text = '',
  Color textcolor = const Color.fromARGB(255, 0, 0, 0),
  int? fontindex,
  aline = TextAlign.center,
  double padding = 30.0,
  Color bgcolor = const Color.fromARGB(255, 190, 190, 190),
  bytes,
  double opacity = 1,
  double textsize = 20.0,
  gredintcolors,
  controller,
  fontStyle = 0,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: WidgetsToImage(
        controller: controller,
        child: Container(
          color: Colors.white,
          alignment: Alignment.topCenter,
          width: MediaQuery.of(context).size.width - 15,
          height: MediaQuery.of(context).size.height / 2 - 100,
          child: Container(
            decoration: BoxDecoration(
              image: bytes != null
                  ? DecorationImage(
                      image: FileImage(File(bytes)),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: Stack(
              children: [
                // background opacity
                Container(
                  decoration: BoxDecoration(
                    color: gredintcolors == null
                        ? bgcolor.withOpacity(opacity)
                        : Colors.white.withOpacity(opacity),
                    gradient: gredintcolors != null
                        ? LinearGradient(
                            colors: gredintcolors,
                            //  gredintcolors,
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 0.0),
                            stops: const [0.0, 1.0],
                            tileMode: TileMode.clamp,
                          )
                        : null,
                  ),
                ),
                // Text Main
                Center(
                  child: Padding(
                    // setup text padding
                    padding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: padding),
                    child: Text(
                      text.isEmpty ? 'Write Here...' : text.toString(),
                      //  set text alien
                      textAlign: aline,
                      style: TextStyle(
                        // text size
                        fontSize: textsize,
                        // font widet
                        fontWeight: fontStyle == 2
                            ? fontsDataName[fontStyle]
                            : FontWeight.normal,
                        // text color
                        color: textcolor,
                        //font
                        fontFamily:
                            fontindex != null ? AppFonts[fontindex] : null,
                        // font stayle
                        fontStyle: fontStyle != 2
                            ? fontsDataName[fontStyle]
                            : FontStyle.normal,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
