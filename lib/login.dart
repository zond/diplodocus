import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                    "images/google_icon.svg",
                    semanticsLabel: "Google logo",
                  ),
                  onPressed: () { debugPrint("hehu"); },
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
