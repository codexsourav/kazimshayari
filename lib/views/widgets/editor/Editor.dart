import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:kazimshayari/constents/GredentColors.dart';
import 'package:kazimshayari/constents/themeColors.dart';
import 'package:kazimshayari/views/widgets/alerts/Mysnakbar.dart';
import 'package:kazimshayari/views/widgets/editor/actions/setBgGredentColor.dart';
import 'package:kazimshayari/views/widgets/editor/component/FinalButtons.dart';
import 'package:kazimshayari/views/widgets/editor/constents/Alines.dart';
import 'package:kazimshayari/views/widgets/editor/ViewPage.dart';
import 'package:kazimshayari/views/widgets/editor/actions/Setbgcolor.dart';
import 'package:kazimshayari/views/widgets/editor/actions/Setfonts.dart';
import 'package:kazimshayari/views/widgets/editor/actions/Setopacity.dart';
import 'package:kazimshayari/views/widgets/editor/actions/Setpadding.dart';
import 'package:kazimshayari/views/widgets/editor/actions/TextEditor.dart';
import 'package:kazimshayari/views/widgets/editor/actions/Textcolor.dart';
import 'package:kazimshayari/views/widgets/editor/actions/Textsize.dart';
import 'package:kazimshayari/views/widgets/editor/component/BackNavOptions.dart';
import 'package:kazimshayari/views/widgets/editor/component/ButtonsMenu.dart';
import 'package:kazimshayari/views/widgets/editor/constents/Fonts.dart';
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
  Color textcolor = const Color.fromARGB(255, 255, 255, 255);
  int textalineinex = 0;
  int? fontindex = null;
  double textpadding = 10;
  double opcity = 1;
  Color bgcolor = Themecolors.primary;
  int textstyleindex = 0;
  List<Color>? gradientColors;
  Color gcolor1 = Themecolors.primary;
  Color gcolor2 = Themecolors.primary;

  var bgimgibyts = null;
  bool loading = false;

  WidgetsToImageController wtoimgcontroller = WidgetsToImageController();

  // for whitch sption is display

  setOptinindex(index) {
    if (index == 2) {
      settextAline();
      return false;
    } else if (index == 5) {
      setBgimage();
      return false;
    } else if (index == 6) {
      if (bgimgibyts == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(MysnackBar('Select A Image To Use Opacity'));
      } else {
        setState(() {
          optionindex = index;
        });
      }
    } else if (index == 8) {
      settextstyleindex();
      return false;
    } else {
      setState(() {
        optionindex = index;
      });
    }
  }

// set text aline
  settextAline() {
    if (textalineinex != textAline.length - 1) {
      setState(() {
        textalineinex++;
      });
    } else {
      setState(() {
        textalineinex = 0;
      });
    }
  }

  // set text style inxex
  settextstyleindex() {
    if (textstyleindex != fontsDataName.length - 1) {
      setState(() {
        textstyleindex++;
      });
    } else {
      setState(() {
        textstyleindex = 0;
      });
    }
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
    if (gradientColors != null) {
      setState(() {
        gradientColors = null;
      });
    }
    setState(() {
      bgcolor = color;
    });
  }

  // set bg image
  setBgimage() async {
    if (bgimgibyts == null) {
      try {
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['jpg', 'jpeg', 'png'],
        );
        if (result != null) {
          if (result.files.first.path != null) {
            setState(() {
              bgimgibyts = result.files.first.path;
              opcity = 0;
            });
          }
        }
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(MysnackBar('Something Went Wrong!'));
        return false;
      }
    } else {
      // remove imgr
      setState(() {
        bgimgibyts = null;
        opcity = 1;
      });
    }
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

// select gredent color
  selectGredentColors(index) {
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding:
              const EdgeInsets.symmetric(vertical: 100, horizontal: 10),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          title:
              Text(index == 0 ? "Select First Color" : "Select Secend Color"),
          content: ColorPicker(
            padding: EdgeInsets.all(0),
            pickersEnabled: const {
              ColorPickerType.both: false,
              ColorPickerType.wheel: true,
              ColorPickerType.accent: false,
            },
            color: Colors.red,
            onColorChanged: (value) {
              if (index == 0) {
                setState(() {
                  gcolor1 = value;
                  gradientColors = [gcolor1, gcolor2];
                });
              } else {
                setState(() {
                  gcolor2 = value;
                  gradientColors = [gcolor1, gcolor2];
                });
              }
            },
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Ok",
                  style: TextStyle(color: Themecolors.primary),
                ))
          ],
        );
      },
    );
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
            .showSnackBar(MysnackBar('Something Went Wrong!'));
        return false;
      }
      // start work for action
      if (action == 0) {
        // for save file button click
        var time = DateTime.now().millisecondsSinceEpoch;
        // find download path
        Future<String?> findLocalPath() async {
          if (Platform.isAndroid) {
            var directory = "/storage/emulated/0/Download/";
            var dirDownloadExists = await Directory(directory).exists();
            if (dirDownloadExists) {
              directory = "/storage/emulated/0/Download/";
            } else {
              directory = "/storage/emulated/0/Downloads/";
            }

            return directory;
          } else {
            var directory = await getDownloadsDirectory();
            return directory!.path;
          }
        }

        // save on path
        String? downloadPath = await findLocalPath();
        File file2 = File("$downloadPath/Daily_Quotes_$time.jpg");
        await file2.writeAsBytes(wgtbytes);

        setState(() {
          loading = false;
        });

        ScaffoldMessenger.of(context)
            .showSnackBar(MysnackBar('Image Saved Downloads Folder'));
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
        MysnackBar('Something Went Wrong : ( '),
      );
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
      const SizedBox(),
      SetOpacity(onchenge: setOpacity, size: opcity),
      BgColorSet(color: bgcolor, onchenge: setBgcolor),
      const SizedBox(),
      setBgGredentColor(context,
          colors: gradientColors, setcolor: selectGredentColors),
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
            opacity: opcity,
            bgcolor: bgcolor,
            controller: wtoimgcontroller,
            fontStyle: textstyleindex,
            gredintcolors: gradientColors,
            bytes: bgimgibyts,
          ),
        ),
        optionindex != null
            ? Align(
                alignment: Alignment.topLeft,
                child: BackNavOptions(
                  back: backToOptions,
                  task: tasknames[optionindex!],
                ),
              )
            : const SizedBox(height: 15),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                optionindex == null
                    ? Column(
                        children: [
                          buttonMenu(
                            onclick: setOptinindex,
                            alineicon: textAlineIcon[textalineinex],
                            fontstyleicon: textStyleIcon[textstyleindex],
                            isbgimageadd: bgimgibyts == null,
                          ),
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
