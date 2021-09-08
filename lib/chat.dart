import 'package:flutter/material.dart';

import 'game.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(context) {
    final game = InheritedGame.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Diplodocus"),
        ),
        body: Text("chat ${game.get(["Properties", "Desc"])}"),
    );
  }
}
