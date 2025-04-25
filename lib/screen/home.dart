import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todolist/data/database.dart';
import 'package:todolist/util/dialog_box.dart';
import 'package:todolist/util/todo_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

// reference the hive box
final _myBox = Hive.box('mybox');

ToDoDatabase db = ToDoDatabase();

// text controller
final _controller = TextEditingController();

class _HomepageState extends State<Homepage> {
  // check box was tapped
  void checkBoxChanged(bool? value, int index) {
    //set state need to live in state
    setState(() {
      db.toDoList[index][1] =
          !db.toDoList[index][1]; //index is position of toDolist ,1 = bool
    });
    db.updateDataBase();
  }

  //save new task
  void saveNewtask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  //create new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewtask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // delete Task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  void initState() {
    // if this is the 1st time ever use default data
    if (_myBox.get("TODOLIST") == null) {
      db.crateInitialData();
    } else {
      //there already exists data
      db.localData();
    }
    super.initState();
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
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        //listview เลื่อนได้
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFuction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
