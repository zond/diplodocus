import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'globals.dart';
import 'diplicity.dart';
import 'router.gr.dart';

class Game extends StatelessWidget {
  late String gameID;
  Game({Key? key, required this.gameID}) : super(key: key);
  @override
  Widget build(context) {
    return ValueListenableBuilder<APIResponse>(
      valueListenable: gameCache.get(gameID)!,
      builder: (context, game, child) {
        return AutoTabsScaffold(
          routes: [
            MapRoute(gameID: gameID),
            ChatRoute(gameID: gameID),
            OrdersRoute(gameID: gameID),
          ],
          bottomNavigationBuilder: (_, tabsRouter) {
            return BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: tabsRouter.setActiveIndex,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.map), label: "Map"),
                BottomNavigationBarItem(icon: Icon(Icons.forum), label: "Chat"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.checklist), label: "Orders"),
              ],
            );
          },
        );
      },
    );
  }
}
