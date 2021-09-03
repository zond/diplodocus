import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:diplodocus/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(
  clientId: "635122585664-rs3u2tb9lfi1tt6dsovie0kfdg1j5mru.apps.googleusercontent.com",
  scopes: [
    'email',
  ],
);

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
                    _googleSignIn.signIn().then((user) {
                      if (user != null) {
                        debugPrint(user.email);
                      } else {
                        debugPrint("Failed");
                      }
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
