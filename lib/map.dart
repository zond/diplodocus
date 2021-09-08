import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'game.dart';

class Map extends StatelessWidget {
  @override
  Widget build(context) {
    final game = InheritedGame.of(context);
    return Text("map ${game.get(["Properties", "Desc"])}");
  }
}
