import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'students.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE students(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        rollNo INTEGER,
        className TEXT,
        gender TEXT,
        mobile TEXT,
        email TEXT
      )
    ''');
  }

  Future<int> insertStudent(Map<String, dynamic> student) async {
    Database db = await instance.database;
    return await db.insert('students', student);
  }

  Future<List<Map<String, dynamic>>> getAllStudents() async {
    Database db = await instance.database;
    return await db.query('students');
  }
}
