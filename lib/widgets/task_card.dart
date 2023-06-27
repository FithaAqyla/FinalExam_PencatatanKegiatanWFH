import 'package:finalexamflutter/model/task_item_model.dart';
import 'package:finalexamflutter/widgets/status.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    required this.item,
    this.isDeptHead = false,
    super.key,
  });

  final TaskItemModel item;
  final bool isDeptHead;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 100,
        maxHeight: 150,
      ),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              if (isDeptHead)
                Text(
                  item.member,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              const Spacer(),
              const Status()
            ],
          )
        ],
      ),
    );
  }
}
