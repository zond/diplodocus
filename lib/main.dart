import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'conditional.dart' if (dart.library.html) 'conditional_html.dart';
import 'globals.dart';

void main() async {
  await Hive.initFlutter();
  rootBox = await Hive.openBox('root');
  configureApp();
  serverRoot.reload().then((root) {
    root.value.fetchLink("variants").then((resp) {
      variants.copyFrom(resp);
    });
  });
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
