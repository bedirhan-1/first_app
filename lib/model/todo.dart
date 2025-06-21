class Todo {
  String id;
  String title;
  String? description;
  bool isDone;

  Todo({
    required this.id,
    required this.title,
    this.description,
    this.isDone = false,
  });

  static List<Todo> todoList() {
    return [];
  }
}
