import 'package:flutter/material.dart';

import 'game.dart';
import 'spinner.dart';
import 'diplicity.dart';
import 'globals.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(context) {
    final game = InheritedGame.of(context);
    if (game.content == null) {
      return Spinner();
    }
    return Text("chat ${game.get(["Properties", "Desc"])}");
  }
}
