import 'dart:html';

import 'package:flutter/material.dart';
import 'package:tthh_navidad/router.dart';
import 'dart:ui' as ui;
import 'package:tthh_navidad/src/landing_page/html_handler.dart';

void main() {
  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(
      'hello-html',
      (int viewId) => IFrameElement()
        ..src = 'assets/resources/html/index.html'
        ..style.border = 'none');
  RouterFluro.setupRouter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Christmas Party',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouterFluro.router.generator,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
        useMaterial3: true,
      ),
      home: HTMLWidget(),
    );
  }
}
