import 'dart:io';
import 'package:ez_qr/services/database/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dbBackupRepoProvider = Provider<DatabaseBackupRepo>(
  (ref) => DatabaseBackupRepo(db: ref.watch(databaseProvider)),
);

class DatabaseBackupRepo {
  final LocalDatabase db;

  DatabaseBackupRepo({required this.db});

  Future<File> backupDatabase() => db.backupDatabase();

  Future<void> restoreDatabase(String backupPath) =>
      db.restoreDatabase(backupPath);
}
