import 'package:finalexamflutter/controller/task_controller.dart';
import 'package:finalexamflutter/view/color.dart';
import 'package:finalexamflutter/view/task_detail.dart';
import 'package:finalexamflutter/widgets/task_card.dart';
import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final taskController = TaskController();

  @override
  void initState() {
    super.initState();
    taskController.initial().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task'),
        backgroundColor: backgroundss,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<Widget>(
                  builder: (context) => const TaskDetail(),
                ),
              );
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(18),
          itemCount: taskController.data?.tasks.length ?? 0,
          itemBuilder: (context, index) {
            final item = taskController.data!.tasks[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: TaskCard(
                item: item,
                isDeptHead: taskController.data?.user.role == 1,
                maxTitleLines: 3,
                isStatusExpanded: true,
                onBack: () {
                  taskController.initial().then((value) {
                    setState(() {});
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
