import 'dart:html';

import 'package:flutter/material.dart';

class HTMLWidget extends StatefulWidget {
  @override
  _HTMLWidgetState createState() => _HTMLWidgetState();
}

class _HTMLWidgetState extends State<HTMLWidget> {
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.maxFinite, // Define el ancho del iframe
      height: double.maxFinite, // Define la altura del iframe
      child: AspectRatio(
        aspectRatio: 1,
        child: HtmlElementView(viewType: 'hello-html'),
      ),
    );
  }
}