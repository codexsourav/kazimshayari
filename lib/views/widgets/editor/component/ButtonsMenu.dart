import 'package:flutter/material.dart';
import 'package:kazimshayari/views/widgets/editor/component/Option.dart';

Widget buttonMenu({onclick, alineicon, fontstyleicon, isbgimageadd = true}) {
  return GridView.count(
      crossAxisCount: 5,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      padding: const EdgeInsets.all(15),
      children: [
        Options(
          icon: Icons.format_size_sharp,
          text: 'Text Size',
          index: 0,
          onclick: onclick,
        ),
        Options(
          icon: Icons.color_lens,
          text: "Text Color",
          index: 1,
          onclick: onclick,
        ),
        Options(
          icon: alineicon,
          text: "Text Aline",
          index: 2,
          onclick: onclick,
        ),
        Options(
          icon: Icons.font_download_rounded,
          text: "Font",
          index: 3,
          onclick: onclick,
        ),
        Options(
          icon: Icons.format_indent_increase_rounded,
          text: 'Padding',
          index: 4,
          onclick: onclick,
        ),
        Options(
          icon: isbgimageadd ? Icons.image : Icons.image_not_supported_rounded,
          text: isbgimageadd ? "Add Image" : "Remove",
          index: 5,
          onclick: onclick,
        ),
        Options(
          icon: Icons.opacity,
          text: "Opacity",
          index: 6,
          onclick: onclick,
        ),
        Options(
          icon: Icons.colorize_sharp,
          text: "Bg Color",
          index: 7,
          onclick: onclick,
        ),
        Options(
          icon: fontstyleicon,
          text: "Text Style",
          index: 8,
          onclick: onclick,
        ),
        Options(
          icon: Icons.format_color_fill_rounded,
          text: "Gradient",
          index: 9,
          onclick: onclick,
        ),
      ]);
}
