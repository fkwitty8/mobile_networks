import 'package:flutter/material.dart';

import '../db/database_helper.dart';
import '../models/task_item.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priorityController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void _submitTask() async {
    if (_formKey.currentState!.validate()) {
      final newTask = TaskItem(
        title: _titleController.text,
        priority: _priorityController.text.isEmpty
            ? 'Normal'
            : _priorityController.text,
        description: _descriptionController.text,
      );

      // INSERT into SQLite database
      await DatabaseHelper.instance.insertTask(newTask);

      Navigator.pop(context); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Task / Note")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
    
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                validator: (val) =>
                    val == null || val.isEmpty ? 'Enter title' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _priorityController,
                decoration: const InputDecoration(
                  labelText: 'Priority (e.g., High, Normal)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitTask,
                child: const Text("Submit Task"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
