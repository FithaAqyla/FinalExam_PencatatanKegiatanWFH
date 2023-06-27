import 'package:finalexamflutter/controller/task_controller.dart';
import 'package:finalexamflutter/controller/task_detail_constroller.dart';
import 'package:finalexamflutter/model/task_Item_model.dart';
import 'package:finalexamflutter/view/home_page.dart';
import 'package:finalexamflutter/view/status.dart';
import 'package:flutter/material.dart';

class TaskDetail extends StatefulWidget {
  const TaskDetail({
    super.key,
    this.isEdit = true,
    this.documentId = '',
  });

  final bool isEdit;
  final String documentId;

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  final taskController = TaskDetailController();

  bool isEdit = false;

  @override
  void initState() {
    super.initState();
    isEdit = widget.isEdit;
    if (widget.documentId.isNotEmpty) {
      taskController.selectedDocument = widget.documentId;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: taskController.initial(widget.documentId),
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              if (isEdit) ...[
                TextButton(
                  onPressed: () {
                    if (!isValid()) return;
                    if (isEdit && taskController.selectedDocument.isNotEmpty) {
                      taskController.edit(
                        TaskItemModel(
                          title: taskController.titleController.text,
                          date: taskController.dateController.text,
                          status: int.tryParse(
                                  taskController.statusController.text) ??
                              1,
                          content: taskController.contentController.text,
                        ),
                      );
                    } else {
                      taskController.save(
                        TaskItemModel(
                          title: taskController.titleController.text,
                          date: taskController.dateController.text,
                          status: int.tryParse(
                                  taskController.statusController.text) ??
                              1,
                          content: taskController.contentController.text,
                        ),
                      );
                    }
                    setState(() {
                      isEdit = false;
                    });
                    notification('Success', Colors.green);
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ] else ...[
                TextButton(
                  onPressed: () {
                    setState(() {
                      isEdit = true;
                    });
                  },
                  child: const Text(
                    'Edit',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ],
          ),
          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                TextField(
                  controller: taskController.titleController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Add Title Here',
                    enabled: isEdit,
                  ),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: isEdit ? datePopUp : null,
                      child: Row(
                        children: [
                          const Icon(Icons.calendar_month),
                          Text(
                            taskController.dateController.text,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: isEdit ? statusPopUp : null,
                      child: Status(
                        type: StatusType.values[
                            int.parse(taskController.statusController.text) -
                                1],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .7,
                  child: TextField(
                    controller: taskController.contentController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Add your content here..',
                      enabled: isEdit,
                    ),
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    expands: true,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void statusPopUp() {
    showModalBottomSheet<Widget>(
      context: context,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * .5,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.cancel_outlined,
                  ),
                ),
                RadioListTile(
                  value: 1,
                  title: const Text('Ready to Review'),
                  groupValue: int.parse(taskController.statusController.text),
                  onChanged: (value) {
                    taskController.statusController.text = value.toString();
                    setState(() {});
                    Navigator.pop(context);
                  },
                ),
                RadioListTile(
                  value: 2,
                  title: const Text('On Review'),
                  groupValue: int.parse(taskController.statusController.text),
                  onChanged: (value) {
                    taskController.statusController.text = value.toString();
                    setState(() {});
                    Navigator.pop(context);
                  },
                ),
                RadioListTile(
                  value: 3,
                  title: const Text('Reject'),
                  groupValue: int.parse(taskController.statusController.text),
                  onChanged: (value) {
                    taskController.statusController.text = value.toString();
                    setState(() {});
                    Navigator.pop(context);
                  },
                ),
                RadioListTile(
                  value: 4,
                  title: const Text('Need Revise'),
                  groupValue: int.parse(taskController.statusController.text),
                  onChanged: (value) {
                    taskController.statusController.text = value.toString();
                    setState(() {});
                    Navigator.pop(context);
                  },
                ),
                RadioListTile(
                  value: 5,
                  title: const Text('Done'),
                  groupValue: int.parse(taskController.statusController.text),
                  onChanged: (value) {
                    taskController.statusController.text = value.toString();
                    setState(() {});
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> datePopUp() async {
    final resultDate = await showDatePicker(
      context: context,
      initialDate: DateTime.parse(taskController.dateController.text),
      currentDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (resultDate != null) {
      taskController.dateController.text =
          resultDate.toString().split(' ').first;
      setState(() {});
    } else {
      return;
    }
  }

  bool isValid() {
    if (taskController.titleController.text.isEmpty) {
      notification('title is empty', Colors.red);
      return false;
    } else if (taskController.contentController.text.isEmpty) {
      notification('content is empty', Colors.red);
      return false;
    }
    return true;
  }

  void notification(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }
}
