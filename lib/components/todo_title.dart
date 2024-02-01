import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: taskCompleted
                ? BorderRadius.circular(20)
                : BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: Slidable(
            endActionPane: ActionPane(
              motion: StretchMotion(),
              extentRatio: 0.2,
              children: [
                SlidableAction(
                  onPressed: deleteFunction,
                  icon: Icons.delete,
                  backgroundColor: Theme.of(context).colorScheme.tertiary,
                  foregroundColor: Colors.red.shade800,
                )
              ],
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
              child: Row(
                children: [
                  Checkbox(
                    value: taskCompleted,
                    onChanged: onChanged,
                    activeColor: Theme.of(context).colorScheme.primary,
                    checkColor: Theme.of(context).colorScheme.secondary,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      taskName,
                      style: TextStyle(
                        decoration: taskCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
