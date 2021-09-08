import 'package:diplodocus/diplicity.dart';
import 'package:flutter/material.dart';

import 'game_list.dart';
import 'globals.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<APIResponse>(
        valueListenable: serverRoot,
        builder: (context, serverRoot, child) {
          final startedGamesUrl = serverRoot.findLink("my-started-games");
          final stagingGamesUrl = serverRoot.findLink("my-staging-games");
          final finishedGamesUrl = serverRoot.findLink("my-finished-games");
          return ListView(
              children: [
                if (startedGamesUrl != null) GameList(url: startedGamesUrl),
                if (stagingGamesUrl != null) GameList(url: stagingGamesUrl),
                if (finishedGamesUrl != null) GameList(url: finishedGamesUrl),
              ],
          );
        },
    );
  }
}
