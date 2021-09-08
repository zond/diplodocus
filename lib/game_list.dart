import 'package:flutter/material.dart';

import 'diplicity.dart';
import 'globals.dart';
import 'router.gr.dart';
import 'spinner.dart';

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

class GameList extends StatelessWidget {
  late ReloadNotifier games;

  GameList({Key? key, required Uri url}) : super(key: key) {
    games = ReloadNotifier(value: APIResponse(null), url: url);
    games.reload().then((reloaded) {
      (reloaded.value.get(["Properties"]) as List<dynamic>).forEach((element) {
        final game = ReloadNotifier.fromGame(
            APIResponse(element as Map<String, dynamic>));
        final gameID = game.value.get(["Properties", "ID"]) as String;
        gameCache.set(gameID, game);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<APIResponse>(
      valueListenable: games,
      builder: (context, games, child) {
        if (games.content == null) {
          return SizedBox.shrink();
        }
        return Column(
          children: (games.get(["Properties"]) as List<dynamic>).map((el) {
            return _Element(
                gameID: APIResponse(el as Map<String, dynamic>)
                    .get(["Properties", "ID"]) as String);
          }).toList(),
        );
      },
    );
  }
}
