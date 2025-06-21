import 'package:first_app/constants/Colors.dart';
import 'package:first_app/model/todo.dart';

import '../widgets/to_do_item.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todolist = Todo.todoList();
  List<Todo> foundList = [];
  final _textFieldController = TextEditingController();

  handleToggleTodo(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  handleDeleteTodo(Todo todo) {
    setState(() {
      todolist.remove(todo);
    });
  }

  handleNewTodo(String title) {
    setState(() {
      if (title.trim().isNotEmpty) {
        todolist.add(
          Todo(id: DateTime.now().millisecond.toString(), title: title),
        );
        _textFieldController.clear();
      }

      _textFieldController.clear();
    });
  }

  void runFilter(String searchText) {
    List<Todo> results = [];
    if (searchText.isEmpty) {
      results = todolist;
    } else {
      results = todolist
          .where(
            (item) =>
                item.title.toLowerCase().contains(searchText.toLowerCase()),
          )
          .toList();
    }

    setState(() {
      foundList = results;
    });
  }

  @override
  void initState() {
    foundList = todolist;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bg,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: TextField(
              onChanged: (value) => runFilter(value),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Icon(Icons.search),
                prefixIconConstraints: BoxConstraints(
                  maxHeight: 20,
                  minWidth: 25,
                ),
                border: InputBorder.none,
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.black38),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20),
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "All Todo's",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -3,
                    ),
                  ),
                ),
                for (var todo in foundList)
                  ToDoItem(
                    todo: todo,
                    onTodoChanged: () {
                      handleToggleTodo(todo);
                    },
                    onTodoDelete: () {
                      handleDeleteTodo(todo);
                    },
                  ),
              ],
            ),
          ),
          SafeArea(
            child: Container(
              decoration: BoxDecoration(
                border: Border(top: BorderSide(width: 2, color: Colors.blue)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (value) => setState(() {}),
                        controller: _textFieldController,
                        decoration: InputDecoration(
                          hintText: "Add new todo",
                          hintStyle: TextStyle(
                            color: const Color.fromARGB(165, 33, 149, 243),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(20),
                          prefixIcon: Icon(Icons.add, color: Colors.blue),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => handleNewTodo(_textFieldController.text),
                      child: Text(
                        "Add",
                        style: TextStyle(
                          color: _textFieldController.text.isEmpty
                              ? Colors.blueGrey
                              : Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
