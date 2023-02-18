import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kazimshayari/views/widgets/alerts/Mysnakbar.dart';
import 'package:kazimshayari/views/widgets/editor/component/FinalButtons.dart';
import 'package:kazimshayari/views/widgets/editor/constents/Alines.dart';

import 'package:kazimshayari/views/widgets/editor/ViewPage.dart';
import 'package:kazimshayari/views/widgets/editor/actions/Setbgcolor.dart';
import 'package:kazimshayari/views/widgets/editor/actions/Setbgimg.dart';
import 'package:kazimshayari/views/widgets/editor/actions/Setfonts.dart';
import 'package:kazimshayari/views/widgets/editor/actions/Setopacity.dart';
import 'package:kazimshayari/views/widgets/editor/actions/Setpadding.dart';
import 'package:kazimshayari/views/widgets/editor/actions/TextEditor.dart';
import 'package:kazimshayari/views/widgets/editor/actions/Textcolor.dart';
import 'package:kazimshayari/views/widgets/editor/actions/Textsize.dart';
import 'package:kazimshayari/views/widgets/editor/component/BackNavOptions.dart';
import 'package:kazimshayari/views/widgets/editor/component/ButtonsMenu.dart';
import 'package:kazimshayari/views/widgets/editor/constents/TaskName.dart';
import 'package:share_plus/share_plus.dart';
import 'package:widgets_to_image/widgets_to_image.dart';
import 'package:path_provider/path_provider.dart';

class Editor extends StatefulWidget {
  final shayari;
  const Editor({super.key, this.shayari});

  @override
  State<Editor> createState() => _EditorState();
}

class _EditorState extends State<Editor> {
// shayari text all ddefaukt
  int? optionindex;
  String shayari = '';
  double textFontsize = 22;
  Color textcolor = Color.fromARGB(255, 255, 255, 255);
  int textalineinex = 0;
  int fontindex = 0;
  double textpadding = 10;
  double opcity = 0.5;
  Color bgcolor = Color.fromARGB(255, 0, 0, 0);
  int bgimgindex = 2;
  bool loading = false;

  WidgetsToImageController wtoimgcontroller = WidgetsToImageController();

  // for whitch sption is display

  setOptinindex(index) {
    if (index == 2) {
      if (textalineinex != textAline.length - 1) {
        setState(() {
          textalineinex++;
        });
      } else {
        setState(() {
          textalineinex = 0;
        });
      }
      return false;
    }
    setState(() {
      optionindex = index;
    });
  }

// on back btn click
  backToOptions() {
    setState(() {
      optionindex = null;
    });
  }

// set font size
  settextFontsize(index) {
    setState(() {
      textFontsize = index;
    });
  }

  // set text color

  settextColor(color) {
    setState(() {
      textcolor = color;
    });
  }

// set font styles
  setfontStyle(index) {
    setState(() {
      fontindex = index;
    });
  }

// set text padding
  setpadding(index) {
    setState(() {
      textpadding = index;
    });
  }

// set opacity
  setOpacity(val) {
    setState(() {
      opcity = val;
    });
  }

  // set bg color
  setBgcolor(color) {
    setState(() {
      bgcolor = color;
    });
  }

  // set bg image
  setBgimage(index) {
    setState(() {
      bgimgindex = index;
    });
  }

  // onedit text
  setText() {
    showDialog(
      context: context,
      builder: (BuildContext context) => TextEditor(
        onsave: setTextComplet,
        text: shayari,
      ),
    );
  }

  // onedit text compleet
  setTextComplet(text) {
    Navigator.of(context).pop();
    setState(() {
      shayari = text;
    });
  }

// final save or share
  savaAndShare(action) async {
// hide alert bar
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    setState(() {
      loading = true;
    });

    try {
      final wgtbytes = await wtoimgcontroller.capture();
      // chack can error widget to iamge
      if (wgtbytes == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(MysnackBar('Sumthing Want Wrong!'));
        return false;
      }
      // start work for action
      if (action == 0) {
        // for save file button click
        var time = DateTime.now().millisecondsSinceEpoch;
        final directory = Directory('/storage/emulated/0/Download');
        File file2 = File("${directory.path}/Daily_Quotes_$time.jpg");
        await file2.writeAsBytes(wgtbytes);
        setState(() {
          loading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(MysnackBar('Image Saved'));
      } else {
        // for share button
        final t = await getTemporaryDirectory();
        final path = "${t.path}/Daily_Quotes.png";
        await File(path).writeAsBytes(wgtbytes);
        setState(() {
          loading = false;
        });
        await Share.shareXFiles([XFile(path)]);
      }
    } catch (e) {
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        MysnackBar('Sumthing Want Wrong : ( '),
      );
      print(e);
    }
  }

// in page start
  @override
  void initState() {
    super.initState();
    if (widget.shayari != null) {
      shayari = widget.shayari;
    } else {
      shayari = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    // allpage screen
    List optionPages = [
      TextSizeSet(onchenge: settextFontsize, size: textFontsize),
      TextColorSet(onchenge: settextColor, color: textcolor),
      const SizedBox(),
      setFonts(ontap: setfontStyle),
      SetPadding(onchenge: setpadding, size: textpadding),
      setBgImg(ontap: setBgimage),
      SetOpacity(onchenge: setOpacity, size: opcity),
      BgColorSet(color: bgcolor, onchenge: setBgcolor),
    ];

    // return page
    return Column(
      children: [
        GestureDetector(
          onTap: setText,
          child: Viewpage(
            context,
            textsize: textFontsize,
            textcolor: textcolor,
            aline: textAline[textalineinex],
            text: shayari,
            fontindex: fontindex,
            padding: textpadding,
            bgimgindex: bgimgindex,
            opacity: opcity,
            bgcolor: bgcolor,
            controller: wtoimgcontroller,
          ),
        ),
        optionindex != null
            ? Align(
                alignment: Alignment.topLeft,
                child: BackNavOptions(
                    back: backToOptions, task: tasknames[optionindex!]))
            : const SizedBox(height: 15),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                optionindex == null
                    ? Column(
                        children: [
                          buttonMenu(onclick: setOptinindex),
                          FinalButton(
                            context,
                            onclick: savaAndShare,
                            loading: loading,
                          ),
                        ],
                      )
                    : optionPages[optionindex!],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
