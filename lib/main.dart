import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(DiplodocusApp());
}

class DiplodocusApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diplodocus',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) => DiplodocusStart());
        }
        return MaterialPageRoute(builder: (context) => DiplodocusStart());
      },
    );
  }
}

class DiplodocusStart extends StatelessWidget {
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
