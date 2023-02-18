import 'package:flutter/material.dart';
import 'package:kazimshayari/model/LocalDb.dart';
import 'package:kazimshayari/views/widgets/components/ShowFav.dart';

class FevouritePage extends StatefulWidget {
  const FevouritePage({super.key});

  @override
  State<FevouritePage> createState() => _FevouritePageState();
}

class _FevouritePageState extends State<FevouritePage> {
  var localdb = LocalDb.instense;
  var data = [];

  setFavdata() {
    setState(() {
      data = localdb.getSaved();
    });
  }

  @override
  void initState() {
    super.initState();
    setFavdata();
  }

  @override
  Widget build(BuildContext context) {
    return data.isNotEmpty
        ? showFav(data)
        : const Center(
            child: Text('No Favorite'),
          );
  }
}
