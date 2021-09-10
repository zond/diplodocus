import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import 'game.dart';
import 'globals.dart';
import 'spinner.dart';
import 'diplicity.dart';

class Map extends StatelessWidget {
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
        return Column(
          children: [
            Text("map ${game.get(["Properties", "Desc"])}"),
            InteractiveViewer(
              clipBehavior: Clip.none,
              child: SvgPicture.network(variant.findLink("map").toString(), width: 100, height: 100),
            ),
          ],
        );
      },
    );
  }
}
