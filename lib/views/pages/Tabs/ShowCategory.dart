import 'package:flutter/material.dart';
import 'package:kazimshayari/constents/themeColors.dart';
import 'package:kazimshayari/model/AirtableDb.dart';
import 'package:kazimshayari/views/widgets/alerts/Mysnakbar.dart';

import 'package:kazimshayari/views/widgets/shayaribox/CategoryBtn.dart';

class ShowCategory extends StatefulWidget {
  const ShowCategory({super.key, data});

  @override
  State<ShowCategory> createState() => _ShowCategoryState();
}

class _ShowCategoryState extends State<ShowCategory> {
  var airtable = AirtableDb.instense;
  List? data;

  setData() async {
    try {
      var maindata = await airtable.getCategories();
      setState(() {
        data = maindata['records'];
      });
    } catch (e) {
      setState(() {
        data = [];
      });

      // show alerts

      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      if (e.toString() == "Failed host lookup: 'api.airtable.com'") {
        ScaffoldMessenger.of(context)
            .showSnackBar(MysnackBar('Please Check Your Internet'));
      } else if (e.toString() == 'Connection timed out') {
        ScaffoldMessenger.of(context)
            .showSnackBar(MysnackBar('Connection timed out  : ('));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(MysnackBar('Something Went Wrong!'));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    setData();
  }

  @override
  Widget build(BuildContext context) {
    if (data != null) {
      return GridView.builder(
        itemCount: data!.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: (1 / .46),
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          var cname = data![index]['fields']['Name'];
          return CategoryBtn(context, cname);
        },
      );
    } else {
      return Center(
        child: CircularProgressIndicator(
          color: Themecolors.primary,
        ),
      );
    }
  }
}
