import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' show join;

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

  static const int dbVersion = 1;

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: dbVersion, onCreate: _onCreateDB);
  }

  Future<void> _onCreateDB(Database db, int version) async {
    await db.execute('''CREATE TABLE $history(
        id TEXT PRIMARY KEY,
        data TEXT NOT NULL,
        createdAt INTEGER NOT NULL
    )''');
  }

  Future<File> backupDatabase() async {
    final dbPath = await getDatabasesPath();
    final dbFile = File(join(dbPath, "app-database"));

    // Check if the database file exists
    if (!await dbFile.exists()) {
      throw Exception("Database file does not exist");
    }
    return dbFile;
  }

  Future<void> restoreDatabase(String backupPath) async {
    final backupFile = File(backupPath);

    // Check if the backup file exists
    if (!await backupFile.exists()) {
      throw Exception("Backup file does not exist");
    }

    // Close the current database connection
    if (_database != null) {
      await _database!.close();
      _database = null;
    }

    final dbPath = await getDatabasesPath();
    final dbFile = join(dbPath, "app-database");

    // Delete the current database file if it exists
    final currentDB = File(dbFile);
    if (await currentDB.exists()) {
      await currentDB.delete();
    }

    // Copy the backup file to the database location
    await backupFile.copy(dbFile);
  }
}
