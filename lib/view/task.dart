import 'package:finalexamflutter/controller/task_controller.dart';
import 'package:finalexamflutter/view/color.dart';
import 'package:finalexamflutter/view/home_page.dart';
import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final taskController = TaskController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task'),
        backgroundColor: backgroundss,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: FutureBuilder(
        future: taskController.initial(),
        builder: (context, snapshot) => SafeArea(
          child: ListView.builder(
            padding: const EdgeInsets.all(18),
            itemCount: taskController.data?.tasks.length ?? 0,
            itemBuilder: (context, index) {
              final item = taskController.data!.tasks[index];
              return Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                    color: backgroundss,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Status(),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
