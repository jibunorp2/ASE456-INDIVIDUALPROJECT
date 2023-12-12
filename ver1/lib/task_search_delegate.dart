import 'package:flutter/material.dart';
import 'task.dart';
import 'task_list_item.dart';

class TaskSearchDelegate extends SearchDelegate<String> {
  final List<Task> tasks;

  TaskSearchDelegate(this.tasks);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults();
  }

  Widget _buildSearchResults() {
    final filteredTasks = tasks
        .where((task) =>
            task.date.toLowerCase().contains(query.toLowerCase()) ||
            task.name.toLowerCase().contains(query.toLowerCase()) ||
            task.tag.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filteredTasks.length,
      itemBuilder: (context, index) {
        return TaskListItem(task: filteredTasks[index]);
      },
    );
  }
}
