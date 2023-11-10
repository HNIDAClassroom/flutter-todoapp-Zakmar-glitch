import 'package:flutter/material.dart';
import 'package:tp3/models/new_task.dart';
import 'package:tp3/models/task.dart';
import 'package:tp3/services/firestore.dart';
import 'package:tp3/widgets/tasks_list.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() {
    return _TasksState();
  }
}

class _TasksState extends State<Tasks> {
  final FirestoreService firestoreService = FirestoreService();

  final List<Task> _registeredTasks = [
    Task(
      title: 'Apprendre Flutter',
      description: 'Suivre le cours pour apprendre de nouvelles compétences',
      date: DateTime.now(),
      category: Category.work,
    ),

    Task(
      title: 'Faire les courses',
      description: 'Acheter des provisions pour la semaine',
      date: DateTime.now().subtract(Duration(days: 1)),
      category: Category.shopping,
    ),

    Task(
      title: 'Rediger un CR',
      description: '',
      date: DateTime.now().subtract(Duration(days: 2)),
      category: Category.personal,
    ),

// Add more tasks with descriptions as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: AppBar(
            title: const Text('Flutter ToDoList'),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: _openAddTaskOverlay,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            children: [
              const Text('The title'),
              Expanded(child: TasksList(tasks: _registeredTasks)),
            ],
          ),
        ));
  }

  void _openAddTaskOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const NewTask(),
    );
  }

  void _addTask(Task task) {
    setState(() {
      _registeredTasks.add(task);
      firestoreService.addTask(task);
      Navigator.pop(context);
    });
  }
}
