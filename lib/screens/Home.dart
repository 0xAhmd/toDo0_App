import 'package:flutter/material.dart';
import 'package:todooooooooooooooooooooooooooooooo/constants/colors.dart';
import 'package:todooooooooooooooooooooooooooooooo/widgets/todo_item.dart';

import '../models/todo.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _todoController = TextEditingController();
  List<ToDDo> _found = [];
  final todoList = ToDDo.todoList();

  @override
  void initState() {
    _found = todoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBgColor,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: _found.isEmpty // Check if no tasks are found
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.task,
                                size: 80,
                                color: tdGrey,
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Please add some tasks',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: tdGrey,
                                ),
                              ),
                            ],
                          ),
                        )
                      : ListView(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 50, bottom: 20),
                              child: Text(
                                "All toDos",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            for (ToDDo todo in _found.reversed)
                              ToDoItem(
                                todo: todo,
                                onTodoChanged: _handleToDoChange,
                                onDeleteIteM: DeletetoDoItem,
                              ),
                          ],
                        ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _todoController,
                      decoration: InputDecoration(
                        hintText: 'Add new task',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tdBlue,
                      elevation: 10,
                      minimumSize: Size(60, 60),
                    ),
                    onPressed: () {
                      addNewTasK(_todoController.text);
                    },
                    child: Text(
                      '+',
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleToDoChange(ToDDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void DeletetoDoItem(String id) {
    todoList.removeWhere((item) => item.id == id);
    setState(() {});
  }

  void addNewTasK(String todo) {
    if (_todoController.text.isEmpty) {
      // Show a snackbar or any other form of notification that task title is required
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Task title is required'),
        ),
      );
    } else {
      setState(() {
        todoList.add(ToDDo(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            todoText: todo));
      });
      _todoController.clear();
    }
  }

  void runFilter(String enterKeyword) {
    List<ToDDo> result = [];
    if (enterKeyword.isEmpty) {
      result = todoList;
    } else {
      result = todoList
          .where((item) =>
              item.todoText!.toLowerCase().contains(enterKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _found = result;
    });
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => runFilter(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
          border: InputBorder.none,
          hintText: 'search',
          hintStyle: TextStyle(color: tdGrey),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdBgColor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color: tdBlack,
            size: 30,
          ),
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset("lib/constants/assets/immg.jpg"),
            ),
          ),
        ],
      ),
    );
  }
}
