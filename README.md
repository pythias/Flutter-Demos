# Flutter Demos

A collection of simple demos of Flutter

## How to use

First copy the repo into your disk.

```bash
git clone https://github.com/pythias/Flutter-Demos.git
```

## Index

1. [Hello World](#demo01-hello-world)
1. [Title Bar](#demo02-title-bar)
1. [Buttons and Actions](#demo03-buttons-and-actions)
1. [List View](#demo04-list-view)
1. [Navigation](#demo05-navigation)

---

## Demo01: Hello World

The minimal Flutter app simply calls the runApp function with a [Widget](https://docs.flutter.io/flutter/widgets/Widget-class.html):

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    new Center(
      child: new Text(
        'Hello, world!',
        textDirection: TextDirection.ltr,
      ),
    ),
  );
}
```

## Demo02: Title Bar

A Material Design app starts with the [MaterialApp](https://docs.flutter.io/flutter/material/MaterialApp-class.html) widget:

```dart
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
```

## Demo03: Buttons and Actions

The ToDoList class extends [StatefulWidget](https://docs.flutter.io/flutter/widgets/StatefulWidget-class.html)

```dart
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

```

## Demo04: List View

```dart
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
```

## Demo05: Navigation

Mobile apps typically reveal their contents via full-screen elements called "screens" or "pages". In Flutter these elements are called routes and they're managed by a [Navigator](https://docs.flutter.io/flutter/widgets/Navigator-class.html) widget. The navigator manages a stack of [Route](https://docs.flutter.io/flutter/widgets/Route-class.html) objects and provides methods for managing the stack, like [Navigator.push](https://docs.flutter.io/flutter/widgets/Navigator/push.html) and [Navigator.pop](https://docs.flutter.io/flutter/widgets/Navigator/pop.html).

Although you can create a navigator directly, it's most common to use the navigator created by a WidgetsApp or a MaterialApp widget. You can refer to that navigator with [Navigator.of](https://docs.flutter.io/flutter/widgets/Navigator/of.html).

```dart
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
```