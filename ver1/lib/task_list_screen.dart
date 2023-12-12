import 'package:flutter/material.dart';
import 'package:time_tracker_testing/task_search_delegate.dart';
import 'package:time_tracker_testing/task.dart';
import 'task_list_item.dart';

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<Task> tasks = [];
  List<Task> filteredTasks = [];
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task List'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: TaskSearchDelegate(tasks),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredTasks.length,
        itemBuilder: (context, index) {
          return TaskListItem(task: filteredTasks[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTaskDialog(context);
        },
        tooltip: 'Add Task',
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    TextEditingController taskNameController = TextEditingController();
    TextEditingController taskDateController = TextEditingController();
    TextEditingController taskTimeFromController = TextEditingController();
    TextEditingController taskTimeToController = TextEditingController();
    TextEditingController taskTagController = TextEditingController();

    DateTime selectedDate = DateTime.now();
    TimeOfDay selectedTimeFrom = TimeOfDay.now();
    TimeOfDay selectedTimeTo = TimeOfDay.now();

    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2022),
        lastDate: DateTime(2030),
      );
      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
          taskDateController.text = picked.toLocal().toString().split(' ')[0];
        });
      }
    }

    Future<void> _selectTimeFrom(BuildContext context) async {
      final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: selectedTimeFrom,
      );
      if (picked != null && picked != selectedTimeFrom) {
        setState(() {
          selectedTimeFrom = picked;
          taskTimeFromController.text = picked.format(context);
        });
      }
    }

    Future<void> _selectTimeTo(BuildContext context) async {
      final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: selectedTimeTo,
      );
      if (picked != null && picked != selectedTimeTo) {
        setState(() {
          selectedTimeTo = picked;
          taskTimeToController.text = picked.format(context);
        });
      }
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Task'),
          content: Column(
            children: [
              TextField(
                controller: taskNameController,
                decoration: InputDecoration(labelText: 'Task Name'),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: taskDateController,
                      readOnly: true,
                      decoration: InputDecoration(labelText: 'Date'),
                      onTap: () => _selectDate(context),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: taskTimeFromController,
                      readOnly: true,
                      decoration: InputDecoration(labelText: 'Time From'),
                      onTap: () => _selectTimeFrom(context),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: taskTimeToController,
                      readOnly: true,
                      decoration: InputDecoration(labelText: 'Time To'),
                      onTap: () => _selectTimeTo(context),
                    ),
                  ),
                ],
              ),
              TextField(
                controller: taskTagController,
                decoration: InputDecoration(labelText: 'Tag'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                String taskName = taskNameController.text;
                String taskDate = taskDateController.text;
                String taskTimeFrom = taskTimeFromController.text;
                String taskTimeTo = taskTimeToController.text;
                String taskTag = taskTagController.text;

                if (taskName.isNotEmpty &&
                    taskDate.isNotEmpty &&
                    taskTimeFrom.isNotEmpty &&
                    taskTimeTo.isNotEmpty) {
                  setState(() {
                    tasks.add(Task(
                      name: taskName,
                      date: taskDate,
                      timeFrom: taskTimeFrom,
                      timeTo: taskTimeTo,
                      tag: taskTag,
                    ));
                  });

                  Navigator.pop(context); // Close the dialog
                } else {
                  // Show an error message or handle invalid input
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _filterTasks(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredTasks = List.from(tasks);
      } else {
        query = query.toLowerCase();
        filteredTasks = tasks.where((task) {
          return task.date.toLowerCase().contains(query) ||
              task.name.toLowerCase().contains(query) ||
              task.tag.toLowerCase().contains(query);
        }).toList();
      }
    });
  }
}
