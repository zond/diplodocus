import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'conditional.dart' if (dart.library.html) 'conditional_html.dart';

import 'router.gr.dart';
import 'diplicity.dart';

final appRouter = AppRouter();
final serverHost = Uri.parse("https://diplicity-engine.appspot.com");
var serverRoot = ResponseJSON(null);

void main() async {
  await Hive.initFlutter();
  configureApp();
  runApp(App());
}

class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}


class AppState extends State<App> {
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
