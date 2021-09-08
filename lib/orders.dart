import 'package:flutter/material.dart';

import 'game.dart';
import 'globals.dart';

class Orders extends StatelessWidget {
  @override
  Widget build(context) {
    final game = InheritedGame.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Diplodocus"),
      ),
      body: Text("orders ${game.get(["Properties", "Desc"])}"),
    );
  }
}
