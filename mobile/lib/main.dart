import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'home.dart';

void main() {
  debugPaintSizeEnabled = true;
  runApp(
    MaterialApp(
      title: 'Speedometer App',
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => HomeView()
      },
    )
  );
}

