import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(
      title: "Title Bar",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Title'),
        ),
        body: new Center(
          child: new Text('Hello, world!', textDirection: TextDirection.ltr),
        ),
      ),
    ),
  );
}
