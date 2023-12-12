import 'package:flutter/material.dart';
import 'task.dart';

class TaskListItem extends StatelessWidget {
  final Task task;

  TaskListItem({required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Date: ${task.date}'),
          Text('Time: ${task.timeFrom} - ${task.timeTo}'),
          Text('Tag: ${task.tag}'),
        ],
      ),
    );
  }
}
