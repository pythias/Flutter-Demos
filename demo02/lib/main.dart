import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(color: Colors.blue[500]),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Text(
              'ToDo List',
              style: Theme.of(context).primaryTextTheme.title,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class MyBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Center(
        child: new Text('Look what you make do!'),
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Column(
        children: <Widget>[
          new MyAppBar(),
          new MyBody(),
        ],
      ),
    );
  }
}

void main() {
  runApp(new MaterialApp(
    title: 'Material App',
    home: new MyScaffold(),
  ));
}
