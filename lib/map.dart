import 'package:flutter/material.dart';
import 'dart:typed_data';

import 'game.dart';
import 'globals.dart';
import 'spinner.dart';
import 'diplicity.dart';

class Map extends StatefulWidget {
  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  Uint8List? mapBytes;

  @override
  Widget build(context) {
    final game = InheritedGame.of(context);
    return ValueListenableBuilder<APIResponse>(
      valueListenable: variants,
      builder: (context, variants, child) {
        final variant = variants.get<APIResponse>([
          "Properties",
          (APIResponse variant) =>
              variant.get<String>(["Properties", "Name"]) ==
              game.get<String>(["Properties", "Variant"])
        ]);
        if (game.content == null || variants.content == null) {
          return Spinner();
        }
        return Column(
          children: [
            Text("map ${game.get([
                  "Properties",
                  "Desc"
                ])} ${variant.findLink("map")}"),
          ],
        );
      },
    );
  }
}
