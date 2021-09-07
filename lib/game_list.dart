import 'package:flutter/material.dart';

import 'diplicity.dart';

class GameList extends StatefulWidget {
  late Uri url;

  GameList({Key? key, required this.url}) : super(key: key);

  @override
  State<GameList> createState() => _GameListState();
}

class _Element extends StatefulWidget {
  late ResponseJSON game;

  _Element({Key? key, required this.game}) : super(key: key);

  @override
  State<_Element> createState() => _ElementState();
}

class _ElementState extends State<_Element> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(widget.game.get(["Properties", "Desc"]) as String),
      onPressed: () => debugPrint("click!"),
    );
  }
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
    return Column(
      children: (data?.content?["Properties"] as List<dynamic>?)
              ?.where((element) => element != null)
              .map((el) =>
                  _Element(game: ResponseJSON(el as Map<String, dynamic>)))
              .toList() ??
          [],
    );
    return Text("HEHU");
  }
}
