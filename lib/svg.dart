import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class SVG extends StatelessWidget {
  late String source;

  SVG({Key? key, required this.source}) : super(key: key);

  @override
  Widget build(context) {
    return InAppWebView(
        initialData:
            InAppWebViewInitialData(data: source, mimeType: "image/svg+xml"));
  }
}
