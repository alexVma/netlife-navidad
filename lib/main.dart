import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:tthh_navidad/src/landing_page/html_handler.dart';

void main() {
  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(
      'hello-html',
      (int viewId) => IFrameElement()
        ..src = 'assets/html/index.html'
        ..style.border = 'none');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Christmas Party',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HTMLWidget(),
    );
  }
}
