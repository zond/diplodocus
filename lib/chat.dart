import 'package:flutter/material.dart';

import 'game.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(context) {
    final game = InheritedGame.of(context);
    return Text("chat ${game.get(["Properties", "Desc"])}");
  }
}
