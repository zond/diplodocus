import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'globals.dart';

class Start extends StatefulWidget {
  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  void initState() {
    serverRoot.fetchLink("my-started-games").then((resp) {
      if (resp != null) debugPrint(resp.toString());
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Diplodocus"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Main'),
          ],
        ),
      ),
    );
  }
}
