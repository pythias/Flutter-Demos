import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: 'ToDo List',
    home: new ToDoList(),
  ));
}

class ToDoList extends StatefulWidget {
  @override
  _NewToDoState createState() => new _NewToDoState();
}

class _NewToDoState extends State<ToDoList> {
  String _title = 'Hello World!';
  int _times = 0;

  void _addButtonClicked() {
    setState(() {
      _times++;
      _title = 'Add button was clicked $_times ${_times > 1 ? 'times' : 'time'}!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Title'),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.add), onPressed: _addButtonClicked),
        ],
      ),
      body: new Center(
        child: new Text(_title),
      ),
    );
  }
}
