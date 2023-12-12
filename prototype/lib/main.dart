import 'package:flutter/material.dart';

void main() {
  runApp(TimeManagementApp());
}

class TimeManagementApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Management App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskListScreen(),
    );
  }
}

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task List'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TaskListItem(task: tasks[index]);
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
}

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

class Task {
  final String name;
  final String date;
  final String timeFrom;
  final String timeTo;
  final String tag;

  Task({
    required this.name,
    required this.date,
    required this.timeFrom,
    required this.timeTo,
    required this.tag,
  });
}
