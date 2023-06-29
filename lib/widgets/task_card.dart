import 'package:finalexamflutter/model/task_item_model.dart';
import 'package:finalexamflutter/view/color.dart';
import 'package:finalexamflutter/view/task_detail.dart';
import 'package:finalexamflutter/widgets/status.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    required this.item,
    this.isDeptHead = false,
    this.maxTitleLines = 1,
    this.isStatusExpanded = false,
    this.onBack,
    this.onDelete,
    super.key,
  });

  final TaskItemModel item;
  final bool isDeptHead;
  final bool isStatusExpanded;
  final int maxTitleLines;
  final VoidCallback? onBack;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
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
        ).then((value) {
          if (onBack != null) {
            onBack!.call();
          }
        });
      },
      child: Container(
        constraints: const BoxConstraints(
          maxHeight: 150,
        ),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: backgroundss,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            if (onDelete != null) ...[
              IconButton(
                onPressed: onDelete,
                icon: const Icon(
                  Icons.delete_outline,
                  color: Colors.white,
                ),
              ),
            ],
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: maxTitleLines,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (maxTitleLines <= 2) ...[
                    const Spacer(),
                  ],
                  const SizedBox(height: 8),
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
                      Status(
                        type: StatusType.values.firstWhere(
                          (element) => element.index == (item.status - 1),
                        ),
                        isExpand: isStatusExpanded,
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
