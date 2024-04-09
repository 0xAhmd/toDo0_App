class ToDDo {
  String? id;
  String? todoText;
  bool isDone;
  ToDDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDDo> todoList() {
    return [
      ToDDo(id: '01', todoText: 'SampleData', isDone: false),
    ];
  }
}
