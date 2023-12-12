import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker_testing/firebase_options.dart';
import 'package:time_tracker_testing/task.dart';
import 'package:time_tracker_testing/task_list_screen.dart';

final firestore = FirebaseFirestore.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(TimeManagementApp());
}

class TimeManagementApp extends StatefulWidget {
  @override
  State<TimeManagementApp> createState() => _TimeManagementAppState();
}

class _TimeManagementAppState extends State<TimeManagementApp> {
  get tasks => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Management App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else {
            return TaskListScreen();
          }
        },
      ),
    );
  }

  Future<void> setData(String name, String date, String timeFrom, String timeTo,
      String tag) async {
    Task task = Task(
        name: name, date: date, timeFrom: timeFrom, timeTo: timeTo, tag: tag);
    try {
      await FirebaseFirestore.instance.collection('HW8').add({
        'name': task.name,
        'date': task.date,
        'timeFrom': task.timeFrom,
        'timeTo': task.timeTo,
        'tag': task.tag,
      });
      print("Data added successfully");
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> getData() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('HW8').get();

      setState(() {
        tasks.clear();
      });

      querySnapshot.docs.forEach((doc) {
        setState(() {
          tasks.add(Task.fromSnapshot(doc));
        });
      });

      print("Data fetched successfully");
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  void _incrementCounter({
    required String name,
    required String date,
    required String timeFrom,
    required String timeTo,
    required String tag,
  }) {
    //getData();
    setData(name, date, timeFrom, timeTo, tag);
  }

  @override
  void initState() {
    super.initState();
    // Call _incrementCounter() with default or initial values
    _incrementCounter(
      name: "DefaultName",
      date: "DefaultDate",
      timeFrom: "DefaultTimeFrom",
      timeTo: "DefaultTimeTo",
      tag: "DefaultTag",
    );
  }
}
