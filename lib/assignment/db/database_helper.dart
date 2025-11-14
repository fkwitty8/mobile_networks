import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/task_item.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('taskmanagement_db.db');
    return _database!;
  }

  // Initialize the database
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  // Create the tasks table
  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tasks_table(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        priority TEXT NOT NULL,
        description TEXT NOT NULL,
        isCompleted INTEGER NOT NULL
      )
    ''');
  }

  // Insert a task
  Future<int> insertTask(TaskItem task) async {
    final db = await instance.database;
    return await db.insert('tasks_table', task.toJson());
  }

  // Get all tasks
  Future<List<TaskItem>> getTasks() async {
    final db = await instance.database;
    final result = await db.query('tasks_table');
    return result.map((json) => TaskItem.fromJson(json)).toList();
  }

  // Delete a task by id 
  Future<int> deleteTask(int id) async {
    final db = await instance.database;
    return await db.delete('tasks_table', where: 'id = ?', whereArgs: [id]);
  }

  // Update a task (for marking as completed)
Future<int> updateTask(TaskItem task) async {
  final db = await instance.database;
  return await db.update(
    'tasks_table',        
    task.toJson(),        
    where: 'id = ?',      
    whereArgs: [task.id], 
  );
}

}
