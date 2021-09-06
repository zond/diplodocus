import 'package:flutter/material.dart';

import 'globals.dart';
import 'diplicity.dart';
import 'spinner.dart';
import 'login_button.dart';
import 'toast.dart';
import 'home.dart';

class Start extends StatefulWidget {
  @override
  State<Start> createState() => _StartState();
}

Widget withLoginBackground(Widget widget) {
  return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/login_background.jpg"),
            fit: BoxFit.cover),
      ),
      child: widget);
}

class _Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return withLoginBackground(
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spinner(),
          ],
        ),
      ),
    );
  }
}

class _Login extends StatelessWidget {
  late VoidCallback onLogin;

  _Login({Key? key, required this.onLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return withLoginBackground(
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: LoginButton(onLogin: onLogin),
            ),
          ],
        ),
      ),
    );
  }
}

class _StartState extends State<Start> with TickerProviderStateMixin {
  Map<String, dynamic>? getUser() {
    if (serverRoot.content == null) {
      return null;
    }
    return (serverRoot.content?["Properties"] as Map<String, dynamic>)["User"];
  }

  @override
  void initState() {
    safeFetch(serverHost).then((resp) {
      serverRoot = resp;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Diplodocus"),
        actions: <Widget>[
          if (getUser() != null)
            PopupMenuButton(
              icon: Icon(Icons.person),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text("Logout"),
                  value: 0,
                ),
              ],
              onSelected: (item) {
                switch (item) {
                  case 0:
                    rootBox.delete("token");
                    safeFetch(serverHost).then((resp) {
                      serverRoot = resp;
                      toast(context, "Logged out");
                      setState(() {});
                    });
                }
              },
            ),
        ],
      ),
      body: serverRoot == null
          ? _Loading()
          : getUser() == null
              ? _Login(onLogin: () => setState(() => {}))
              : Home(),
    );
  }
}
