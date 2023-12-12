import 'package:cloud_firestore/cloud_firestore.dart';

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

  factory Task.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return Task(
      name: data['name'] ?? '',
      date: data['date'] ?? '',
      timeFrom: data['timeFrom'] ?? '',
      timeTo: data['timeTo'] ?? '',
      tag: data['tag'] ?? '',
    );
  }
}
