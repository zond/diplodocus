import 'package:flutter/material.dart';
import 'dart:typed_data';

import 'game.dart';
import 'globals.dart';
import 'spinner.dart';
import 'diplicity.dart';
import 'svg.dart' if (dart.library.html) 'svg_html.dart';

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
        if (game.content == null || variants.content == null) {
          return Spinner();
        }
        final variant = variants.get<APIResponse>([
          "Properties",
          (APIResponse variant) =>
              variant.get<String>(["Properties", "Name"]) ==
              game.get<String>(["Properties", "Variant"])
        ]);
        return ValueListenableBuilder<String?>(
          valueListenable: webCache.get(variant.findLink("map"))!,
          builder: (context, svgSource, child) {
            if (svgSource == null) {
              return Spinner();
            }
            return Column(
              children: [
                Text("map ${game.get([
                      "Properties",
                      "Desc"
                    ])} ${variant.findLink("map")}"),
                Expanded(
                  child: InteractiveViewer(
                    maxScale: 10,
                    minScale: 0.1,
                    child: SVG(source: svgSource),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
