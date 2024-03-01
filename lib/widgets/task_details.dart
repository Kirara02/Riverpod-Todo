import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:riverpod_todo/data/data.dart';
import 'package:riverpod_todo/utils/extensions.dart';
import 'package:riverpod_todo/widgets/widgets.dart';

class TaskDetails extends StatelessWidget {
  final Task task;
  const TaskDetails({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme;
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          CircleContainer(
            color: task.category.color.withOpacity(0.3),
            child: Icon(
              task.category.icon,
              color: task.category.color,
            ),
          ),
          const Gap(16),
          Text(
            task.title,
            style: style.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(task.time, style: style.titleMedium),
          const Gap(16),
          Visibility(
            visible: !task.isCompleted,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Task to be completed on '),
                Text(task.date),
                Icon(
                  Icons.check_box,
                  color: task.category.color,
                ),
              ],
            ),
          ),
          const Gap(16),
          Divider(
            color: task.category.color,
            thickness: 1.5,
          ),
          const Gap(16),
          Text(
            task.note.isEmpty
                ? 'There is no additional note for this task'
                : task.note,
            style: context.textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const Gap(16),
          Visibility(
            visible: task.isCompleted,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Task Completed'),
                Icon(
                  Icons.check_box,
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
