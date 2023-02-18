import 'package:flutter/material.dart';
import 'package:kazimshayari/views/pages/AllCategorys.dart';
import 'package:kazimshayari/views/widgets/components/AppcategoryBtn.dart';

Widget Topbar(context, {onclick, index, datanames}) {
  return Container(
    margin: EdgeInsets.only(top: 10),
    child: Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          AppcategoryBtn(
            context,
            active: index == 0,
            title: datanames[0].toString(),
            onclick: () => onclick(0),
          ),
          AppcategoryBtn(
            context,
            active: index == 1,
            title: datanames[1].toString(),
            onclick: () => onclick(1),
          ),
          AppcategoryBtn(
            context,
            active: index == 2,
            title: datanames[2].toString(),
            onclick: () => onclick(2),
          ),
        ]),
        SizedBox(height: 10),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          AppcategoryBtn(
            context,
            active: index == 3,
            title: datanames[3].toString(),
            onclick: () => onclick(3),
          ),
          AppcategoryBtn(
            context,
            active: index == 4,
            title: datanames[4].toString(),
            onclick: () => onclick(4),
          ),
          AppcategoryBtn(
            context,
            active: false,
            title: 'View All',
            onclick: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AllCategorys(),
                ),
              );
            },
          ),
        ]),
      ],
    ),
  );
}
