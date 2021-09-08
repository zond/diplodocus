import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

import 'router.gr.dart';
import 'globals.dart';

class ReloadNotifier extends ValueNotifier<APIResponse> {
  late Uri url;
  Function(APIResponse)? onLoad;

  ReloadNotifier(
      {required APIResponse value,
      required Uri this.url,
      this.onLoad,
      bool forceLoad = false})
      : super(value) {
    if (forceLoad) {
      reload();
    }
  }

  static ReloadNotifier fromGame(APIResponse game) {
    return ReloadNotifier(value: game, url: serverHost.replace(path: "Game/${game.get(["Properties", "ID"]) as String}"));
  }

  void reload() {
    safeFetch(url).then((newValue) {
      onLoad?.call(newValue);
      this.value = newValue;
    });
  }
}

class APIResponse {
  late Map<String, dynamic>? content;
  late int status;

  APIResponse(this.content, {this.status = 0});

  dynamic get(List<dynamic> indices) {
    dynamic here = content;
    while (true) {
      if (indices.length == 0) {
        return here;
      }
      if (here == null) {
        return null;
      }
      if (indices[0] is int && here is List<dynamic>) {
        here = here[indices[0] as int];
        indices = indices.sublist(1);
      } else if (indices[0] is String && here is Map<String, dynamic>) {
        here = here[indices[0] as String];
        indices = indices.sublist(1);
      } else {
        return null;
      }
    }
  }

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

  Future<APIResponse?> fetchLink(String rel) async {
    Uri? uri = this.findLink(rel);
    if (uri == null) {
      return null;
    }
    return safeFetch(uri);
  }
}

Future<APIResponse> safeFetch(Uri uri) async {
  var done = false;
  late http.Response resp;
  while (!done) {
    final headers = {"Accept": "application/json"};
    if (rootBox.containsKey("token")) {
      headers["Authorization"] = "bearer ${rootBox.get("token")}";
    }
    resp = await http.get(uri, headers: headers);
    if (resp.statusCode == 401) {
      rootBox.delete("token");
      serverRoot.value = await safeFetch(serverHost);
      await appRouter.push(LoginRoute());
    } else if (resp.statusCode == 200) {
      done = true;
    } else {
      debugPrint("${uri.toString} => ${resp.statusCode}");
      done = true;
    }
  }
  return APIResponse(jsonDecode(resp.body), status: resp.statusCode);
}
