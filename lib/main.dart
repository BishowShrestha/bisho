import 'dart:core' as prefix0;
import 'dart:core';

import 'package:flutter/material.dart';

import 'src/categories/categories.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo',
      theme: ThemeData(),
      home: HomePage(),
    );
  }
}
