import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Diplodocus"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text('Main'),
          ],
        ),
      ),
    );
  }
}
