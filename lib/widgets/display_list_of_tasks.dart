import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo/data/data.dart';
import 'package:riverpod_todo/providers/providers.dart';
import 'package:riverpod_todo/utils/utils.dart';
import 'package:riverpod_todo/widgets/widgets.dart';

class DisplayListOfTasks extends ConsumerWidget {
  const DisplayListOfTasks({
    super.key,
    required this.tasks,
    this.isCompletedTask = false,
  });
  final List<Task> tasks;
  final bool isCompletedTask;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = context.deviceSize;
    final height =
        isCompletedTask ? deviceSize.height * 0.25 : deviceSize.height * 0.3;
    final emptyTasksMessage = isCompletedTask
        ? "There is no completed task yet"
        : "There is no task todo";

    return CommonContainer(
      height: height,
      child: tasks.isEmpty
          ? Center(
              child: Text(
                emptyTasksMessage,
                style: context.textTheme.headlineSmall,
              ),
            )
          : ListView.separated(
              shrinkWrap: true,
              itemCount: tasks.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return InkWell(
                  onLongPress: () async =>
                      await AppAlerts.showAlertDeleteDialog(
                    context: context,
                    ref: ref,
                    task: task,
                  ),
                  onTap: () async {
                    await showModalBottomSheet(
                      context: context,
                      builder: (context) => TaskDetails(task: task),
                    );
                  },
                  child: TaskTile(
                    task: task,
                    onCompleted: (value) async {
                      await ref
                          .read(taskProvider.notifier)
                          .updateTask(task)
                          .then(
                            (value) => AppAlerts.displaySnackbar(
                                context,
                                task.isCompleted
                                    ? "Task incompleted"
                                    : "Task completed"),
                          );
                    },
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                thickness: 1.5,
              ),
            ),
    );
  }
}
