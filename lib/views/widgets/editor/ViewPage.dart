import 'package:flutter/material.dart';
import 'package:kazimshayari/views/widgets/editor/constents/Fonts.dart';
import 'package:kazimshayari/views/widgets/editor/constents/Images.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

Widget Viewpage(
  context, {
  String text = '',
  Color textcolor = const Color.fromARGB(255, 0, 0, 0),
  int fontindex = 0,
  aline = TextAlign.center,
  double padding = 30.0,
  Color bgcolor = const Color.fromARGB(255, 219, 219, 219),
  bgimgindex,
  double opacity = 1,
  double textsize = 20.0,
  List<Color>? gredintcolors,
  controller,
}) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: ClipRRect(
      child: WidgetsToImage(
        controller: controller,
        child: Container(
          alignment: Alignment.topCenter,
          width: MediaQuery.of(context).size.width - 15,
          height: MediaQuery.of(context).size.height / 2 - 160,
          decoration: BoxDecoration(
            image: bgimgindex != null
                ? DecorationImage(
                    image: AssetImage(ImagesPath[bgimgindex]),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: Stack(
            children: [
              // background opacity
              Container(
                decoration: BoxDecoration(
                  color: bgcolor.withOpacity(opacity),
                  gradient: gredintcolors != null
                      ? LinearGradient(
                          colors: gredintcolors,
                          // [
                          //   Color.fromARGB(255, 255, 51, 51),
                          //   Color.fromARGB(255, 255, 115, 0),
                          // ],
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
                      // fontWeight: FontWeight.bold,
                      // text color
                      color: textcolor,
                      //font
                      fontFamily: AppFonts[fontindex],
                      // font stayle
                      // fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
