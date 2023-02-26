import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kazimshayari/constents/themeColors.dart';
import 'package:kazimshayari/model/LocalDb.dart';
import 'package:kazimshayari/views/pages/EditorPage.dart';
import 'package:share_plus/share_plus.dart';

class ShayariView extends StatefulWidget {
  var quotes;

  ShayariView({super.key, this.quotes});

  @override
  State<ShayariView> createState() => _ShayariViewState();
}

class _ShayariViewState extends State<ShayariView> {
  var text;
  var username = '';
  var localstorage = LocalDb.instense;
  bool isfav = false;

// add or remove favirate
  addremoveFav(sid) {
    if (isfav) {
      localstorage.deleteData(sid);
      setState(() {
        isfav = false;
      });
    } else {
      localstorage.addSaved(widget.quotes);
      setState(() {
        isfav = true;
      });
    }
  }

// chack if fav exist
  setFav(sid) {
    var res = localstorage.chackexistondb(sid);
    if (res == sid) {
      setState(() {
        isfav = true;
      });
    } else {
      setState(() {
        isfav = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
// set shayari
    text = widget.quotes['fields']['Quotes'].toString();
    // get username
    var getusername = widget.quotes['fields']['User Name'].toString();
    if (getusername == 'null') {
      username = '';
    } else {
      username = getusername;
    }
// chack exist fav
    setFav(widget.quotes['id']);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 0),
      width: MediaQuery.of(context).size.width - 15,
      height: 240,
      decoration: BoxDecoration(
        color: Themecolors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 12, left: 15, bottom: 10),
            alignment: Alignment.topLeft,
            child: Image.asset(
              'assets/images/quotation.png',
              width: 20.0,
              height: 17.4277,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EditorPage(shayari: text),
                  ));
                },
                child: Text(
                  '$text',
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Themecolors.textcolor,
                    fontSize: 18.5,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 45,
            alignment: Alignment.bottomCenter,
            width: MediaQuery.of(context).size.width - 30,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/icon.png',
                      width: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      username,
                      style: TextStyle(
                        color: Themecolors.primary,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),

                // actions buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () async {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditorPage(shayari: text),
                        ));
                      },
                      color: Themecolors.primary.withOpacity(0.7),
                      icon: const Icon(Icons.edit_note_rounded, size: 22),
                    ),
                    IconButton(
                      onPressed: () {
                        addremoveFav(widget.quotes['id']);
                      },
                      color: Themecolors.primary.withOpacity(0.7),
                      icon: Icon(
                        isfav
                            ? FontAwesomeIcons.solidHeart
                            : FontAwesomeIcons.heart,
                        size: 20,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Share.share(text);
                      },
                      color: Themecolors.primary.withOpacity(0.7),
                      icon: const Icon(
                        Icons.share,
                        size: 22,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
