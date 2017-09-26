import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(
      title: "List",
      home: new ToDoList(),
    ),
  );
}

class ToDoList extends StatefulWidget {
  @override
  _NewToDoState createState() => new _NewToDoState();
}

class _NewToDoState extends State<ToDoList> {
  List<Widget> _list = [];

  void _addButtonClicked() {
    setState(() {
      _list.add(new ListTile(title: new Text('List Item ${_list.length}')));
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Title'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.add), onPressed: _addButtonClicked),
        ],
      ),
      body: new ListView(
        children: _list.map((item) => item).toList(),
      ),
    );
  }
}
