import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wusla/components/bottom_sheet.dart';
import 'package:wusla/components/fullScreen_box.dart';
import 'package:wusla/components/todo_title.dart';
import 'package:wusla/data/databse.dart';
import 'package:wusla/theme/light_theme.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _controller = TextEditingController();
  final _mybox = Hive.box('mybox');
  ToDoDatabse db = ToDoDatabse();

  @override
  void initState() {
    super.initState();
    if (_mybox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
  }

  void checkboxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDatabse();
  }

  void saveNewTask() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        db.todoList.add([_controller.text, false]);
        _controller.clear();
      });
      Navigator.of(context).pop();
      db.updateDatabse();
    } else {
      // Handle the case when the text is empty
    }
  }

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDatabse();
  }

  void _navigateToFullScreen() {
    // Navigate to another screen when the FAB is pressed
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreen(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightMode,
      home: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.tertiary,
            title: Center(
              child: Text(
                'To Do',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _navigateToFullScreen,
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Icon(
              Icons.add,
              color: Theme.of(context).colorScheme.tertiary,
            ),
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
      ),
    );
  }
}
