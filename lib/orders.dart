import 'package:flutter/material.dart';

import 'game.dart';
import 'globals.dart';

class Orders extends StatelessWidget {
  @override
  Widget build(context) {
    final game = InheritedGame.of(context);
    return Text("orders ${game.get(["Properties", "Desc"])}");
  }
}
