import 'package:diplodocus/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'conditional.dart' if (dart.library.html) 'conditional_html.dart';
import 'router.gr.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Diplodocus"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/login_background.jpg"),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: ElevatedButton.icon(
                  icon: SvgPicture.asset(
                    "assets/images/google_icon.svg",
                    semanticsLabel: "Google logo",
                  ),
                  onPressed: () {
                    final loginUrl = serverRoot.findLink("login");
                    if (loginUrl == null) {
                      debugPrint("No login link found.");
                      return;
                    }
                    final redirectedUrl = loginUrl.replace(query: "redirect-to=${redirectUrl()}");
                    authenticate(url: redirectedUrl.toString(), callbackUrlScheme: "com.diplicity.diplodocus", redirectUrl: redirectUrl()).then((resp) {
                      final resultUrl = Uri.parse(resp);
                      debugPrint(resultUrl.queryParameters["token"]);
                    });
                  },
                  label: const Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
