import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'globals.dart';
import 'diplicity.dart';
import 'router.gr.dart';

class InheritedGame extends InheritedWidget {
  final APIResponse game;
  InheritedGame({Key? key, required this.game, required Widget child})
      : super(key: key, child: child);
  @override
  bool updateShouldNotify(InheritedGame) => true;
  static APIResponse of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedGame>()!.game;
  }
}

class Game extends StatelessWidget {
  late String gameID;
  Game({Key? key, @PathParam("gameID") required this.gameID}) : super(key: key);
  @override
  Widget build(context) {
    return ValueListenableBuilder<APIResponse>(
      valueListenable: gameCache.get(gameID)!,
      builder: (context, game, child) {
        return InheritedGame(
          game: game,
          child: AutoTabsScaffold(
            routes: [
              MapRoute(),
              ChatRoute(),
              OrdersRoute(),
            ],
            appBarBuilder: (context, tabsRouter) {
              if (context.router.canPopSelfOrChildren) {
                return AppBar(
                  title: Text("Diplodocus"),
                );
              } else {
                return AppBar(
                  title: Text("Diplodocus"),
                  leading: BackButton(
                    onPressed: () => appRouter.push(StartRoute()),
                  ),
                );
              }
              return AppBar(
                title: Text("Diplodocus"),
              );
            },
            bottomNavigationBuilder: (_, tabsRouter) {
              return BottomNavigationBar(
                currentIndex: tabsRouter.activeIndex,
                onTap: tabsRouter.setActiveIndex,
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.map), label: "Map"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.forum), label: "Chat"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.checklist), label: "Orders"),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
