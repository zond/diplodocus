import 'package:flutter/material.dart';

import 'diplicity.dart';
import 'globals.dart';
import 'router.gr.dart';

class GameList extends StatefulWidget {
  late Uri url;

  GameList({Key? key, required this.url}) : super(key: key);

  @override
  State<GameList> createState() => _GameListState();
}

class _Element extends StatelessWidget {
  late String gameID;

  _Element({Key? key, required this.gameID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<APIResponse>(
      valueListenable: gameCache.get(gameID)!,
      builder: (context, game, child) {
        return ElevatedButton(
          child: Text(game.get(["Properties", "Desc"]) as String),
          onPressed: () => appRouter.push(
              GameRoute(gameID: game.get(["Properties", "ID"]) as String)),
        );
      },
    );
  }
}

class _GameListState extends State<GameList> {
  List<String> gameIDs = [];
  @override
  void initState() {
    gameIDs = [];
    safeFetch(widget.url).then((resp) {
      (resp.get(["Properties"]) as List<dynamic>).forEach((element) {
        final game = ReloadNotifier.fromGame(
            APIResponse(element as Map<String, dynamic>));
        final gameID = game.value.get(["Properties", "ID"]) as String;
        gameCache.set(gameID, game);
        gameIDs.add(gameID);
      });
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: gameIDs.map((el) => _Element(gameID: el)).toList(),
    );
  }
}
