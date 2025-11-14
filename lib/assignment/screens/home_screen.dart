import 'package:flutter/material.dart';
import 'package:mobile_assessment/assignment/screens/task_screen.dart';
import 'package:provider/provider.dart';

import '../db/database_helper.dart';
import '../models/task_item.dart';
import '../theme_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TaskItem> tasks = [];

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  // Load tasks from SQLite
  Future<void> loadTasks() async {
    final data = await DatabaseHelper.instance.getTasks();
    setState(() {
      tasks = data;
    });
  }

  // Delete a task
  Future<void> deleteTask(int id) async {
    await DatabaseHelper.instance.deleteTask(id);
    await loadTasks();
  }

  // Toggle task completion
  Future<void> toggleCompleted(TaskItem task, bool value) async {
    task.isCompleted = value;
    await DatabaseHelper.instance.updateTask(task);
    await loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Task Notes Manager")),

      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          // Theme toggle
          SwitchListTile(
            title: const Text("Dark Theme"),
            value: themeProvider.isDark,
            onChanged: (val) => themeProvider.toggleTheme(val),
          ),

          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "My Tasks & Notes",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black12,
              ),
            ),
          ),

          // Task list
          Expanded(
            child: tasks.isEmpty
                ? const Center(child: Text("No tasks found."))
                : ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      return ListTile(
                        leading: Checkbox(
                          value: task.isCompleted,
                          onChanged: (val) =>
                              toggleCompleted(task, val ?? false),
                        ),
                        title: Text(
                          task.title,
                          style: TextStyle(
                            decoration: task.isCompleted
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                        subtitle: Text(task.description),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => deleteTask(task.id!),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),

      // Add task button
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddTaskScreen()),
          );
          loadTasks();
        },
      ),
    );
  }
}
