import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Todo App",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Todo app"),
        ),
        body: Container(
          child: ListView(
            children: [ToDoItem()],
          ),
        ),
      ),
    );
  }
}

class ToDoItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Checkbox(
              value: false,
            ),
          ),
          Expanded(flex: 2, child: Text("Test")),
          Expanded(
              flex: 1,
              child: IconButton(
                icon: Icon(Icons.highlight_remove_outlined),
              ))
        ],
      ),
    );
  }
}
