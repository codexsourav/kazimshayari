import 'package:flutter/material.dart';
import 'package:kazimshayari/constents/themeColors.dart';
import 'package:kazimshayari/model/AirtableDb.dart';
import 'package:kazimshayari/views/widgets/alerts/Mysnakbar.dart';
import 'package:kazimshayari/views/widgets/shayaribox/ShayariView.dart';

class CatView extends StatefulWidget {
  final cnmae;
  const CatView({super.key, this.cnmae = ''});

  @override
  State<CatView> createState() => _CatViewState();
}

class _CatViewState extends State<CatView> {
  var airtable = AirtableDb.instense;
  List? data;

  setData() async {
    try {
      var maindata = await airtable.getQuotes(widget.cnmae);
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
    if (!mounted) return;
    setData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themecolors.graybg,
      appBar: AppBar(
        backgroundColor: Themecolors.primary,
        elevation: 0.0,
        title: Text(widget.cnmae),
      ),
      body: data != null
          ? ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 15),
              itemCount: data!.length,
              itemBuilder: (BuildContext context, int index) {
                var quotes = data![index];

                return ShayariView(quotes: quotes);
              },
            )
          : Center(
              child: CircularProgressIndicator(
                color: Themecolors.primary,
              ),
            ),
    );
  }
}
