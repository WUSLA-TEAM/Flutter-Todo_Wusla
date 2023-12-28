import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({
    Key? key,
    required this.onChanged,
    required this.taskCompleted,
    required this.taskName,
    required this.deleteFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25.0, 25, 25, 0),
      child: Container(
        color: Colors.yellow[500], // Set background color here
        child: Slidable(
          endActionPane: ActionPane(motion: StretchMotion(), children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              backgroundColor: Colors.red.shade800,
            )
          ]),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                // Checkbox
                Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                  activeColor: Colors.yellow[800],
                ),
                // Text
                Text(
                  taskName,
                  style: TextStyle(
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
