import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:riverpod_todo/data/data.dart';
import 'package:riverpod_todo/utils/extensions.dart';
import 'package:riverpod_todo/widgets/widgets.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final Function(bool?)? onCompleted;
  const TaskTile({
    super.key,
    required this.task,
    this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme;
    final iconOpacity = task.isCompleted ? 0.3 : 0.5;
    final backgroundOpacity = task.isCompleted ? 0.1 : 0.3;
    final textDecoration =
        task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none;
    final fontWeight = task.isCompleted ? FontWeight.normal : FontWeight.bold;

    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        top: 10,
        bottom: 10,
      ),
      child: Row(
        children: [
          CircleContainer(
            color: task.category.color.withOpacity(backgroundOpacity),
            child: Center(
              child: Icon(
                task.category.icon,
                color: task.category.color.withOpacity(iconOpacity),
              ),
            ),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: style.titleMedium?.copyWith(
                    decoration: textDecoration,
                    fontSize: 20,
                    fontWeight: fontWeight,
                  ),
                ),
                Text(
                  task.note,
                  style: style.titleMedium?.copyWith(
                    decoration: textDecoration,
                  ),
                ),
              ],
            ),
          ),
          Checkbox(
            value: task.isCompleted,
            onChanged: onCompleted,
          ),
        ],
      ),
    );
  }
}
