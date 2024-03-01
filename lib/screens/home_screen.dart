import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_todo/config/config.dart';
import 'package:riverpod_todo/data/data.dart';
import 'package:riverpod_todo/providers/providers.dart';
import 'package:riverpod_todo/utils/utils.dart';
import 'package:riverpod_todo/widgets/widgets.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    final taskState = ref.watch(taskProvider);
    final inCompletedTasks = _incompltedTask(taskState.tasks, ref);
    final completedTasks = _compltedTask(taskState.tasks, ref);
    final selectedDate = ref.watch(dateProvider);

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: deviceSize.height * 0.3,
                width: deviceSize.width,
                color: colors.primary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => Helpers.selectDate(context, ref),
                      child: DisplayWhiteText(
                        text: Helpers.dateFormatter(selectedDate),
                        fontSize: 20,
                      ),
                    ),
                    const DisplayWhiteText(
                      text: "My Todo List",
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: deviceSize.height * 0.15,
            left: 0,
            right: 0,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DisplayListOfTasks(
                      tasks: inCompletedTasks,
                    ),
                    const Gap(20),
                    Text(
                      "Completed",
                      style: context.textTheme.headlineMedium,
                    ),
                    const Gap(20),
                    DisplayListOfTasks(
                      tasks: completedTasks,
                      isCompletedTask: true,
                    ),
                    const Gap(20),
                    ElevatedButton(
                      onPressed: () => context.push(RouteLocation.createTask),
                      child: const DisplayWhiteText(
                        text: "Add New Task",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Task> _incompltedTask(List<Task> tasks, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final List<Task> filteredTask = [];

    for (var task in tasks) {
      if (!task.isCompleted) {
        final isTaskDay = Helpers.isTaskFromSelectedDate(task, date);
        if (isTaskDay) {
          filteredTask.add(task);
        }
      }
    }
    return filteredTask;
  }

  List<Task> _compltedTask(List<Task> tasks, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final List<Task> filteredTask = [];

    for (var task in tasks) {
      if (task.isCompleted) {
        final isTaskDay = Helpers.isTaskFromSelectedDate(task, date);
        if (isTaskDay) {
          filteredTask.add(task);
        }
      }
    }
    return filteredTask;
  }
}
