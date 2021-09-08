import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oauth2_client/src/base_web_auth.dart';
import 'package:oauth2_client/src/web_auth.dart'
// ignore: uri_does_not_exist
    if (dart.library.io) 'package:oauth2_client/src/io_web_auth.dart'
// ignore: uri_does_not_exist
    if (dart.library.html) 'package:oauth2_client/src/browser_web_auth.dart';

import 'conditional.dart' if (dart.library.html) 'conditional_html.dart';
import 'toast.dart';
import 'globals.dart';
import 'diplicity.dart';

class LoginButton extends StatelessWidget {
  late VoidCallback onLogin;

  LoginButton({Key? key, required this.onLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: SvgPicture.asset(
        "assets/images/google_icon.svg",
        semanticsLabel: "Google logo",
      ),
      onPressed: () {
        final loginUrl = serverRoot.value.findLink("login");
        if (loginUrl == null) {
          toast(context, "Error: No login link found.");
          return;
        }
        final redirectedUrl =
            loginUrl.replace(query: "redirect-to=${redirectUrl()}");
        createWebAuth()
            .authenticate(
                url: redirectedUrl.toString(),
                callbackUrlScheme: "com.diplicity.diplodocus",
                redirectUrl: redirectUrl())
            .then((resp) {
          final resultUrl = Uri.parse(resp);
          rootBox.put("token", resultUrl.queryParameters["token"]);
          serverRoot.reload();
          toast(context, "Logged in");
          onLogin();
        });
      },
      label: const Text('Login'),
    );
  }
}
