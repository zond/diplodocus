import 'package:flutter/material.dart';

import 'diplicity.dart';

class GameList extends StatefulWidget {
  late Uri url;

  GameList({Key? key, required this.url}) : super(key: key);

  @override
  State<GameList> createState() => _GameListState();
}

class _GameListState extends State<GameList> {
  ResponseJSON? data;
  @override
  void initState() {
    safeFetch(widget.url).then((resp) {
      setState(() {
        data = resp;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text("HEHU");
  }
}
