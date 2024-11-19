import 'package:flutter/material.dart';

class TasksList extends StatefulWidget {
  final String title; // Tytuł listy, np. "Today" lub "Tomorrow"
  const TasksList({super.key, required this.title});

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  List<String> tasks = []; // Początkowo pusta lista zadań

  // Metoda do dodawania nowego zadania
  void addNewTask(String task) {
    setState(() {
      tasks.add(task); // Dodajemy nowe zadanie do listy
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (bool? value) {
                    // Tu można dodać obsługę checkboxa, jeśli potrzeba
                  },
                ),
                Expanded(
                  child: Text(tasks[index]),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}