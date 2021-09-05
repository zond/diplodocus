import 'package:http/http.dart' as http;
import 'dart:convert';

import 'router.gr.dart';
import 'main.dart';

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
