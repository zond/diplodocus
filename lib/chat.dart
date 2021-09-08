import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'globals.dart';
import 'diplicity.dart';

class Chat extends StatelessWidget {
  late String gameID;
  Chat({Key? key, required this.gameID}) : super(key: key);
  @override
  Widget build(context) {
    return ValueListenableBuilder<APIResponse>(
      valueListenable: gameCache.get(gameID)!,
      builder: (context, game, child) {
        return Text("chat");
      },
    );
  }
}