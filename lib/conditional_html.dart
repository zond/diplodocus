import 'dart:html' as html;

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'router.gr.dart';

void configureApp() {
  setUrlStrategy(PathUrlStrategy());
}

String redirectUrl() {
  return "${Uri.base.scheme}://${Uri.base.host}:${Uri.base.port}${OAuth2Route().fullPath}";
}

void postMessage() {
  html.window.opener?.postMessage(Uri.base.toString(), Uri.base.origin);
}
