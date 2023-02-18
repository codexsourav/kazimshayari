import 'package:flutter/material.dart';
import 'package:kazimshayari/views/widgets/editor/component/Option.dart';

Widget buttonMenu({onclick}) {
  return GridView.count(
      crossAxisCount: 4,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      padding: EdgeInsets.all(20),
      children: [
        Options(
          icon: Icons.format_size_sharp,
          text: 'Font Size',
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
          icon: Icons.format_align_center_rounded,
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
          icon: Icons.image,
          text: "Image",
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
      ]);
}
