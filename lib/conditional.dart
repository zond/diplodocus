import 'package:oauth2_client/src/base_web_auth.dart';
import 'package:oauth2_client/src/web_auth.dart'
// ignore: uri_does_not_exist
if (dart.library.io) 'package:oauth2_client/src/io_web_auth.dart'
// ignore: uri_does_not_exist
if (dart.library.html) 'package:oauth2_client/src/browser_web_auth.dart';

void postMessage() {
  throw UnimplementedError("postMessage() not implemented for non-html clients.");
}

void configureApp() {
  throw UnimplementedError("configureApp() not implemented for non-html clients.")
}

String redirectUrl() {
  return "com.diplicity.diplodocus:/OAuth2";
}

Future<String> authenticate(
    {required String callbackUrlScheme,
      required String url,
      required String redirectUrl}) {
  return createWebAuth().authenticate(callbackUrlScheme: callbackUrlScheme, url: url, redirectUrl: redirectUrl);
}