import 'package:flutter/material.dart';

import 'globals.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    Future.wait([
      serverRoot.fetchLink("my-started-games"),
      serverRoot.fetchLink("my-staging-games"),
      serverRoot.fetchLink("my-finished-games")
    ]).then((responses) {
      responses.forEach((element) {
        debugPrint(element?.content.toString());
      });
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text("HEHU");
  }
}
