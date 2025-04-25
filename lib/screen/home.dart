import 'package:flutter/material.dart';
import 'package:todolist/util/todo_tile.dart';

//list of todo task
List toDoList = [
  ["Make tutorial", false], // "text" == 0, bool == 1
  ["Do Exercise", false],
];

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // check box was tapped
  void checkBoxChanged(bool? value, int index) {
    //set state need to live in state
    setState(() {
      toDoList[index][1] =
          !toDoList[index][1]; //index is position of toDolist ,1 = bool
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        title: Text("TO DO", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        //listview เลื่อนได้
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
          );
        },
      ),
    );
  }
}
