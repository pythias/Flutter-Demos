import 'dart:async';
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
  _ToDoListState createState() => new _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List<Widget> _list = [];

  Future<Null> _addButtonClicked() async {
    String text = await Navigator.of(context).push(new MaterialPageRoute<String>(builder: (BuildContext context) => new CreateToDo()));
    setState(() {
      _list.add(new ListTile(title: new Text(text)));
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

class CreateToDo extends StatefulWidget {
  @override
  _CreateToDoState createState() => new _CreateToDoState();
}

class _CreateToDoState extends State<CreateToDo> {
  String _text = '';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('New'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.save),
            onPressed: () {
              Navigator.of(context).pop(_text);
            },
          ),
        ],
      ),
      body: new Center(
        child: new TextField(
          decoration: const InputDecoration(
            labelText: 'Things to do',
          ),
          style: Theme.of(context).textTheme.display1,
          onChanged: (String value) {
            setState(() {
              _text = value;
            });
          },
        ),
      ),
    );
  }
}
