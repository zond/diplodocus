import 'dart:html' as html;
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:oauth2_client/src/base_web_auth.dart';
import 'package:oauth2_client/src/web_auth.dart'
// ignore: uri_does_not_exist
if (dart.library.io) 'package:oauth2_client/src/io_web_auth.dart'
// ignore: uri_does_not_exist
if (dart.library.html) 'package:oauth2_client/src/browser_web_auth.dart';

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

Future<String> authenticate(
    {required String callbackUrlScheme,
      required String url,
      required String redirectUrl}) {
  return createWebAuth().authenticate(callbackUrlScheme: callbackUrlScheme, url: url, redirectUrl: redirectUrl);
}