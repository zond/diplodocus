import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

import 'router.gr.dart';
import 'globals.dart';

class ResponseJSON {
  late Map<String, dynamic>? content;

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
    final headers = {"Accept": "application/json"};
    if (rootBox.containsKey("token")) {
      headers["Authorization"] = "bearer ${rootBox.get("token")}";
    }
    resp = await http.get(uri, headers: headers);
    if (resp.statusCode == 401) {
      await appRouter.push(LoginRoute());
    } else if (resp.statusCode == 200) {
      done = true;
    } else {
      debugPrint("Got ${resp.statusCode}");
      done = true;
    }
  }
  return ResponseJSON(jsonDecode(resp.body));
}
