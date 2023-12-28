import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wusla/components/dilog_box.dart';
import 'package:wusla/components/todo_title.dart';
import 'package:wusla/data/databse.dart';
import 'package:wusla/main.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.themeColor}) : super(key: key);

  final Color themeColor;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Text controller
  final _controller = TextEditingController();

  //box
  final _mybox = Hive.box('mybox');
  ToDoDatabse db = ToDoDatabse();

  @override
  void initState() {
    //1st time oppening
    if (_mybox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      //not first time
      db.loadData();
    }
    // TODO: implement initState
    super.initState();
  }

  // Toggle dark mode
  final bool _isDarkMode = false;

  // List todoList = [
  //   ["Make To DO", false],
  //   ["app", true],
  // ];

  void checkboxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDatabse();
  }

  void saveNewTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear(); // Clear the text controller
    });
    Navigator.of(context).pop(); // Close the dialog
    db.updateDatabse();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //delete task
  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDatabse();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        backgroundColor: _isDarkMode ? Colors.grey[700] : Colors.yellow[200],
        appBar: AppBar(
          backgroundColor: widget.themeColor,
          title: const Center(
            child: Text(
              'To Do',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          backgroundColor: Colors.amber[300],
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: db.todoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskCompleted: db.todoList[index][1],
              taskName: db.todoList[index][0],
              onChanged: (value) => checkboxChanged(value, index),
              deleteFunction: (context) {
                deleteTask(index);
              },
            );
          },
        ),
      ),
    );
  }
}

class TodoItem {
  final String name;
  bool isCompleted;

  TodoItem(this.name, this.isCompleted);
}
