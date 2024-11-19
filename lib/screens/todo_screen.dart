import 'package:flutter/material.dart';
import 'package:open_todo/styles.dart';
import 'package:open_todo/widgets/components/bottom_nav_bar.dart';
import 'package:open_todo/widgets/components/custom_app_bar.dart';
import 'package:open_todo/widgets/todo/tasks_list.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Definiujemy GlobalKey dla TodayTasks i TomorrowTasks
  static final GlobalKey<_TodayTasksState> todayKey = GlobalKey<_TodayTasksState>();
  static final GlobalKey<_TomorrowTasksState> tomorrowKey = GlobalKey<_TomorrowTasksState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: kBackgroundColor,
          appBar: const CustomAppBar(title: 'To Do'),
          body: Column(
            children: [
              const TabBar(
                tabs: [
                  Tab(text: 'Today'),
                  Tab(text: 'Tomorrow'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    TodayTasks(key: todayKey), // Zakładka dla dzisiejszych zadań
                    TomorrowTasks(key: tomorrowKey), // Zakładka dla jutrzejszych zadań
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Wywołujemy metodę dodania nowego zadania w odpowiedniej zakładce
              final tabIndex = DefaultTabController.of(context).index;
              if (tabIndex == 0) {
                todayKey.currentState?.addNewTask("Nowe zadanie na dzisiaj");
              } else if (tabIndex == 1) {
                tomorrowKey.currentState?.addNewTask("Nowe zadanie na jutro");
              }
            },
            child: const Icon(Icons.add),
          ),
          bottomNavigationBar: const BottomNavBar(),
        ),
      ),
    );
  }
}

// Widget do obsługi dzisiejszych zadań
class TodayTasks extends StatefulWidget {
  const TodayTasks({super.key});

  @override
  _TodayTasksState createState() => _TodayTasksState();
}

class _TodayTasksState extends State<TodayTasks> {
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
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

// Widget do obsługi jutrzejszych zadań
class TomorrowTasks extends StatefulWidget {
  const TomorrowTasks({super.key});

  @override
  _TomorrowTasksState createState() => _TomorrowTasksState();
}

class _TomorrowTasksState extends State<TomorrowTasks> {
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