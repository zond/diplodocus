import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'globals.dart';
import 'router.gr.dart';

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

  void copyFrom(ReloadNotifier other) {
    url = other.url;
    onLoad = other.onLoad;
    value = other.value;
  }

  static ReloadNotifier fromGame(APIResponse game) {
    return ReloadNotifier(
        value: game,
        url:
            serverHost.replace(path: "Game/${game.get(["Properties", "ID"])}"));
  }

  Future<ReloadNotifier> reload() async {
    return _safeFetch(url).then((newValue) {
      onLoad?.call(newValue);
      this.value = newValue;
      return this;
    });
  }
}

class APIResponse {
  late Map<String, dynamic>? content;
  late int status;

  APIResponse(this.content, {this.status = 0});

  bool has(List<dynamic> indices) {
    return _get(indices) != null;
  }

  T get<T>(List<dynamic> indices) {
    final found = _get<T>(indices);
    if (found == null) {
      throw Exception(
          "Can't find ${indices.toString()} in ${content.toString()}!");
    }
    return found;
  }

  T? _get<T>(List<dynamic> indices) {
    dynamic here = content;
    while (true) {
      if (indices.length == 0) {
        return here as T;
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

  Uri findLink(String rel) {
    if (this.content == null) {
      throw Exception("Content not loaded!");
    }
    final link = (this.content?["Links"] as List<dynamic>).firstWhere(
        (link) => (link as Map<String, dynamic>)["Rel"] == rel,
        orElse: () => null);
    if (link == null) {
      throw Exception("Link ${rel} not found!");
    }
    return Uri.parse(link["URL"]);
  }

  Future<ReloadNotifier> fetchLink(String rel) async {
    final url = findLink(rel);
    return _safeFetch(url).then((resp) {
      return ReloadNotifier(value: resp, url: url);
    });
  }
}

Future<APIResponse> _safeFetch(Uri uri) async {
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
      serverRoot.value = await _safeFetch(serverHost);
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
