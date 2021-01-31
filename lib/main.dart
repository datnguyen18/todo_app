import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Todo App",
      home: ToDoList(),
    );
  }
}

class ToDoList extends StatefulWidget {
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  final itemInputController = TextEditingController();
  List<ToDoItem> _items = [];
  String inputValue = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo app"),
      ),
      body: Container(
        child: ListView(
          children: _items,
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Add Todo Item'),
              content: Container(
                height: 100,
                child: Column(
                  children: [
                    TextFormField(
                      controller: itemInputController,
                      onChanged: _handleChangeInputField,
                    ),
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          _items = [..._items, ToDoItem(description: inputValue, isCompleted: true,)];
                          inputValue = "";
                          Navigator.pop(context, false);
                        });
                      },
                      child: Text(
                        'Add',
                        style: TextStyle(fontSize: 15),
                      ),
                    )
                  ],
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2.0))),
            );
          },
        );
      }),
    );
  }

  void _handleChangeInputField(String value) {
    setState(() {
      inputValue = value;
    });

  }
}

class ToDoItem extends StatelessWidget {
  final String description;
  final bool isCompleted;

  ToDoItem({this.description, this.isCompleted});

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
          Expanded(flex: 2, child: Text(description)),
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
