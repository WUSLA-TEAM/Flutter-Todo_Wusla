import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wusla/components/bottom_sheet.dart';
import 'package:wusla/components/dilog_box.dart';
import 'package:wusla/components/todo_title.dart';
import 'package:wusla/data/databse.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

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
    if (_controller.text.isNotEmpty) {
      setState(() {
        db.todoList.add([_controller.text, false]);
        _controller.clear();
      });
      Navigator.of(context).pop();
      db.updateDatabse();
    } else {
      //add new feture to make fun
    }
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

  // Future _displayBottomSheet(BuildContext context) {
  //   return showModalBottomSheet(
  //     context: context,
  //     builder: (context) => Container(
  //       height: 200,
  //     ),
  //   );
  // }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheetContent(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () {
            // Handle Cancel button pressed
            Navigator.of(context).pop(); // Close the bottom sheet
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: GestureDetector(
        onTap: () {
          // Close the keyboard when tapping outside of the text field or bottom sheet
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          backgroundColor: Color(0xFF2BB7E3),
          appBar: AppBar(
            backgroundColor: Color(0xFF2BB7E3),
            title: const Center(
              child: Text(
                'To Do',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _showBottomSheet,
            backgroundColor: Color(0xFF351A87),
            child: const Icon(
              Icons.add,
              color: Color(0xFFFFFFFF),
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

class TodoItem {
  final String name;
  bool isCompleted;

  TodoItem(this.name, this.isCompleted);
}
