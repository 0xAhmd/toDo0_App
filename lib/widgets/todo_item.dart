import 'package:flutter/material.dart';
import 'package:todooooooooooooooooooooooooooooooo/constants/colors.dart';
import 'package:todooooooooooooooooooooooooooooooo/models/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDDo todo;
  final onTodoChanged;
  final onDeleteIteM;

  const ToDoItem(
      {Key? key,
      required this.todo,
      required this.onTodoChanged,
      required this.onDeleteIteM})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          print('Clicked');
          onTodoChanged(todo);
        },
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdBlue,
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle(
              fontSize: 16,
              color: tdBlack,
              decoration: todo.isDone ? TextDecoration.lineThrough : null),
        ),
        trailing: Container(
          margin: EdgeInsets.symmetric(vertical: 12),
          padding: EdgeInsets.all(0),
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              color: tdRed, borderRadius: BorderRadius.circular(5)),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: () {
              print('Deleted');
              onDeleteIteM(todo.id);
            },
          ),
        ),
      ),
    );
  }
}
