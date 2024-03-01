import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_todo/config/config.dart';
import 'package:riverpod_todo/data/data.dart';
import 'package:riverpod_todo/providers/providers.dart';
import 'package:riverpod_todo/utils/utils.dart';
import 'package:riverpod_todo/widgets/widgets.dart';

class CreateTaskScreen extends ConsumerStatefulWidget {
  const CreateTaskScreen({super.key});

  static CreateTaskScreen builder(BuildContext context, GoRouterState state) =>
      const CreateTaskScreen();

  @override
  ConsumerState<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends ConsumerState<CreateTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.primary,
        title: const DisplayWhiteText(
          text: 'Add New Task',
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CommonTextField(
              hintText: 'Task Title',
              title: 'Task Title',
              controller: _titleController,
            ),
            const Gap(30),
            const CategoriesSelection(),
            const Gap(30),
            const SelectDateTime(),
            const Gap(30),
            CommonTextField(
              hintText: 'Notes',
              title: 'Notes',
              maxLines: 6,
              controller: _noteController,
            ),
            const Gap(30),
            ElevatedButton(
              onPressed: _createTask,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: DisplayWhiteText(
                  text: 'Save',
                ),
              ),
            ),
            const Gap(30),
          ],
        ),
      ),
    );
  }

  void _createTask() async {
    final title = _titleController.text.trim();
    final note = _noteController.text.trim();
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);
    final category = ref.watch(categoryProvider);
    if (title.isNotEmpty) {
      final task = Task(
        title: title,
        note: note,
        time: Helpers.timeToString(time),
        date: Helpers.dateFormatter(date),
        category: category,
        isCompleted: false,
      );

      await ref.read(taskProvider.notifier).createTask(task).then(
        (value) {
          AppAlerts.displaySnackbar(context, "Task Created Successfully!");
          context.go(RouteLocation.home);
        },
      );
    } else {
      AppAlerts.displaySnackbar(context, "Task title cannot be empty");
    }
  }
}
