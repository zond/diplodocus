import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

import 'package:diplodocus/router.gr.dart';
import 'package:diplodocus/login.dart';

final getIt = GetIt.instance;

void main() async {
  await Hive.initFlutter();
  getIt.registerSingleton<AppRouter>(AppRouter());
  runApp(App());
}

class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

Future<Map<String, dynamic>> safeFetch(Uri uri) async {
  var done = false;
  late http.Response resp;
  while (!done) {
    resp = await http.get(uri, headers: { "Accept": "application/json" });
    if (resp.statusCode == 401) {
      await getIt<AppRouter>().push(LoginRoute());
    } else if (resp.statusCode == 200) {
      done = true;
    }
  }
  var res = jsonDecode(resp.body);
  debugPrint(res);
  return res;
}

class AppState extends State<App> {
  final _serverRoot = safeFetch(Uri.parse("https://diplicity-engine.appspot.com/Games/My/Started"));

  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: getIt<AppRouter>().delegate(),
      routeInformationParser: getIt<AppRouter>().defaultRouteParser(),
    );
  }
}


