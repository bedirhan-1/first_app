import 'package:first_app/model/todo.dart';
import 'package:flutter/material.dart';

class ToDoItem extends StatelessWidget {
  final Todo todo;
  final VoidCallback onTodoChanged;
  final VoidCallback onTodoDelete;

  const ToDoItem({
    super.key,
    required this.todo,
    required this.onTodoChanged,
    required this.onTodoDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        child: ListTile(
          onTap: onTodoChanged,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          subtitle: Text(todo.id),
          title: Text(
            todo.title,
            style: TextStyle(
              fontSize: 16,
              color: const Color.fromARGB(221, 33, 32, 32),
              decoration: todo.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          leading: Icon(
            todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
            color: Colors.blue,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          trailing: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.red,
            ),
            child: IconButton(
              iconSize: 18,
              onPressed: onTodoDelete,
              icon: Icon(Icons.delete, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
