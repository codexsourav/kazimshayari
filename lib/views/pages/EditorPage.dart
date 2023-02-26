import 'package:flutter/material.dart';
import 'package:kazimshayari/constents/themeColors.dart';
import 'package:kazimshayari/views/widgets/editor/Editor.dart';

class EditorPage extends StatelessWidget {
  final shayari;
  const EditorPage({super.key, this.shayari});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themecolors.graybg,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Themecolors.primary,
        title: const Text('Create Design'),
        centerTitle: true,
      ),
      body: Editor(shayari: shayari),
    );
  }
}
