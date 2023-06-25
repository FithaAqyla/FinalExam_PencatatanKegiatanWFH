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
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                            child: ElevatedButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      RadioListTile;
                                      return SizedBox(
                                        height: 200,
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              ElevatedButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  child: const Icon(
                                                      Icons.cancel_outlined,),),
                                              RadioListTile(
                                                  value: 1,
                                                  groupValue: 1,
                                                  onChanged: ),
                                                  RadioListTile(
                                                  value: 2,
                                                  groupValue: 2,
                                                  onChanged: ),RadioListTile(
                                                  value: 3,
                                                  groupValue: 3,
                                                  onChanged: ),RadioListTile(
                                                  value: 4,
                                                  groupValue: 4,
                                                  onChanged: )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: const Status(),),),
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
