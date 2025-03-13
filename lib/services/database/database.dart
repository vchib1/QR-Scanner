import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final databaseProvider = Provider<LocalDatabase>((ref) {
  return LocalDatabase();
});

const history = "history";

class LocalDatabase {
  LocalDatabase();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB("app-database");
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _onCreateDB);
  }

  Future<void> _onCreateDB(Database db, int version) async {
    await db.execute('''CREATE TABLE $history(
        id TEXT PRIMARY KEY,
        data TEXT NOT NULL,
        createdAt INTEGER NOT NULL
    )''');
  }
}
