import 'package:flutter/material.dart';

import 'conditional.dart' if (dart.library.html) 'conditional_html.dart';

class OAuth2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    postMessage();
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
              Text("This window should close immediately.",
                  style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
