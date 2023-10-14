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
    return SizedBox(
      width: 500, // Define el ancho del iframe
      height: 500, // Define la altura del iframe
      child: AspectRatio(
        aspectRatio: 1,
        child: HtmlElementView(viewType: 'hello-html'),
      ),
    );
  }
}