import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Next extends StatelessWidget{
  @override
  Next(this.name);
  String name;
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:AppBar(
        title: Text(name),
      )
    );
  }
}