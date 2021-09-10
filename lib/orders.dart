import 'package:flutter/material.dart';

import 'game.dart';
import 'globals.dart';
import 'spinner.dart';
import 'diplicity.dart';

class Orders extends StatelessWidget {
  @override
  Widget build(context) {
    final game = InheritedGame.of(context);
    if (game.content == null) {
      return Spinner();
    }
    return Text("orders ${game.get(["Properties", "Desc"])}");
  }
}
