import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  ToDoTile({
    Key? key,
    required this.onChanged,
    required this.taskCompleted,
    required this.taskName,
    required this.deleteFunction,
  }) : super(key: key);

  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;
  final bool taskCompleted;
  final String taskName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25.0, 25, 25, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: taskCompleted
                ? BorderRadius.circular(50)
                : BorderRadius.circular(0),
            color: Theme.of(context).colorScheme.tertiary,
          ),
          child: Slidable(
            endActionPane: ActionPane(
              motion: const StretchMotion(),
              extentRatio: 0.2,
              children: [
                SlidableAction(
                  onPressed: deleteFunction,
                  icon: Icons.delete,
                  backgroundColor: Theme.of(context).colorScheme.error,
                  foregroundColor: Theme.of(context).colorScheme.primary,
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
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: taskCompleted ? Colors.black : Colors.white,
                        width: 2.0,
                      ),
                    ),
                    child: Checkbox(
                      value: taskCompleted,
                      onChanged: onChanged,
                      checkColor: Colors.white, // Color of the checkmark
                      activeColor:
                          Colors.transparent, // Make the Checkbox transparent
                      materialTapTargetSize: MaterialTapTargetSize
                          .shrinkWrap, // Reduce tap target size
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      taskName,
                      style: TextStyle(
                        decoration: taskCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        color: taskCompleted
                            ? Theme.of(context).colorScheme.error
                            : Theme.of(context).colorScheme.primary,
                        fontFamily: 'futura medium bt',
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
