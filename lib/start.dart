import 'package:flutter/material.dart';

import 'diplicity.dart';
import 'globals.dart';
import 'home.dart';
import 'login_button.dart';
import 'spinner.dart';
import 'toast.dart';

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<APIResponse>(
      valueListenable: serverRoot,
      builder: (context, root, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Diplodocus"),
            automaticallyImplyLeading: false,
            actions: <Widget>[
              if (root.has(["Properties", "User"]))
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
                        serverRoot.reload();
                        toast(context, "Logged out");
                    }
                  },
                ),
            ],
          ),
          body: root.status == 0
              ? _Loading()
              : root.has(["Properties", "User"])
                  ? Center(child: Home())
                  : _Login(),
        );
      },
    );
  }
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
      Spinner(),
    );
  }
}

class _Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return withLoginBackground(
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: LoginButton(onLogin: () => serverRoot.reload()),
            ),
          ],
        ),
      ),
    );
  }
}
