import 'dart:convert';

import 'package:diplodocus/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

final appRouter = AppRouter();
final serverHost = Uri.parse("https://diplicity-engine.appspot.com");
var serverRoot = ResponseJSON(null);

void main() async {
  await Hive.initFlutter();
  runApp(App());
}

class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class ResponseJSON {
  final Map<String, dynamic>? content;

  ResponseJSON(this.content);

  Uri? findLink(String rel) {
    if (this.content == null) {
      return null;
    }
    final link = (this.content?["Links"] as List<dynamic>).firstWhere(
        (link) => (link as Map<String, dynamic>)["Rel"] == rel,
        orElse: () => null);
    if (link == null) {
      return null;
    }
    return Uri.parse(link["URL"]);
  }

  Future<ResponseJSON?> fetchLink(String rel) async {
    Uri? uri = this.findLink(rel);
    if (uri == null) {
      return null;
    }
    return safeFetch(uri);
  }
}

Future<ResponseJSON> safeFetch(Uri uri) async {
  var done = false;
  late http.Response resp;
  while (!done) {
    resp = await http.get(uri, headers: {"Accept": "application/json"});
    if (resp.statusCode == 401) {
      await appRouter.push(LoginRoute());
    } else if (resp.statusCode == 200) {
      done = true;
    }
  }
  return ResponseJSON(jsonDecode(resp.body));
}

class AppState extends State<App> {
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
