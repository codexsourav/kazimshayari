import 'package:flutter/material.dart';
import 'package:kazimshayari/constents/themeColors.dart';
import 'package:kazimshayari/model/AirtableDb.dart';
import 'package:kazimshayari/model/LocalDb.dart';
import 'package:kazimshayari/views/widgets/alerts/Mysnakbar.dart';
import 'package:kazimshayari/views/widgets/components/Topbar.dart';
import 'package:kazimshayari/views/widgets/shayaribox/ShayariView.dart';

class HomeShayaris extends StatefulWidget {
  const HomeShayaris({super.key});

  @override
  State<HomeShayaris> createState() => _HomeShayarisState();
}

class _HomeShayarisState extends State<HomeShayaris> {
  var savedDb = LocalDb.instense;
  ScrollController scrollController = ScrollController();
  int showskip = 10;

  int showcathome = 0;

  List topmenu = [
    'Latest Quotes',
    'Attitude Quotes',
    'Love Quotes',
    'Success Quotes',
    'Trust Quotes'
  ];

  var airtable = AirtableDb.instense;
  List? data;
  List? showdata;

  setData() async {
    try {
      var maindata = await airtable.getQuotes(topmenu[showcathome]);
      setState(() {
        data = maindata['records'];
        showdata = data!.take(10).toList();
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

// scroll paginatiomn
  _scrollListener() {
    scrollController.addListener(
      () async {
        if (data != null) {
          if (scrollController.position.pixels ==
                  scrollController.position.maxScrollExtent &&
              data!.length != showdata!.length) {
            setState(() {
              showdata = [...showdata!, ...data!.skip(showskip).take(10)];
              showskip = showskip + 10;
            });
          }
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    setData();
    _scrollListener();
  }

  onclickbtn(index) async {
    setState(() {
      showcathome = index;
      setState(() {
        data = null;
        showdata = null;
        showskip = 10;
      });
    });
    setData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Topbar(context,
                onclick: onclickbtn, datanames: topmenu, index: showcathome),
            // make Shayari Page
            data != null
                ? Column(
                    children: [
                      for (var getdata in showdata!)
                        ShayariView(
                          quotes: getdata,
                        ),
                      SizedBox(height: 20),
                    ],
                  )
                : SizedBox(
                    height: 200,
                    child: Center(
                      child:
                          CircularProgressIndicator(color: Themecolors.primary),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
