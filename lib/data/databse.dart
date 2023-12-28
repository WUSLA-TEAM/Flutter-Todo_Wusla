import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabse {
  List todoList = [];
  //reference box
  final _mybox = Hive.box('mybox');

//for fistime user get
  void createInitialData() {
    todoList = [
      ["Make A ToDo Activity", false]
    ];
  }

  //load data
  void loadData() {
    todoList = _mybox.get("TODOLIST");
  }

  //update the databse
  void updateDatabse() {
    _mybox.put("TODOLIST", todoList);
  }
}
