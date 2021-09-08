import 'package:flutter/material.dart';

import 'diplicity.dart';

class GameList extends StatefulWidget {
  late Uri url;

  GameList({Key? key, required this.url}) : super(key: key);

  @override
  State<GameList> createState() => _GameListState();
}

class _Element extends StatefulWidget {
  late APIResponse game;

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
  late ReloadNotifier data;
  @override
  void initState() {
    data = ReloadNotifier(value: APIResponse(null), url: widget.url, forceLoad: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<APIResponse>(
      valueListenable: data,
      builder: (context, games, child) {
        return Column(
          children: (games.content?["Properties"] as List<dynamic>?)
              ?.where((element) => element != null)
              .map((el) =>
              _Element(game: APIResponse(el as Map<String, dynamic>)))
              .toList() ??
              [],
        );
      },
    );
    return Text("HEHU");
  }
}
