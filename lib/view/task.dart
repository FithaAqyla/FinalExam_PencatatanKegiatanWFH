import 'package:finalexamflutter/controller/task_controller.dart';
import 'package:finalexamflutter/view/color.dart';
import 'package:finalexamflutter/view/task_detail.dart';
import 'package:finalexamflutter/widgets/status.dart';
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
      body: FutureBuilder(
        future: taskController.initial(),
        builder: (context, snapshot) => SafeArea(
          child: ListView.builder(
            padding: const EdgeInsets.all(18),
            itemCount: taskController.data?.tasks.length ?? 0,
            itemBuilder: (context, index) {
              final item = taskController.data!.tasks[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<Widget>(
                      builder: (context) {
                        return TaskDetail(
                          isEdit: false,
                          documentId: item.id,
                        );
                      },
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: backgroundss,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      IconButton(
                        onPressed: () {
                          // taskController.deleteContact(id).then(
                          //   (value) {
                          //     setState(() {
                          //       taskController.initial();
                          //     });
                          //   },
                          // );
                        },
                        icon: const Icon(
                          Icons.delete_outline_outlined,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          if (taskController.data?.user.role == 1) ...[
                            Text(
                              item.member,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 8),
                          ],
                          const Spacer(),
                          const Status(),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
