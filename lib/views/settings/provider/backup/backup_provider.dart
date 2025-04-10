import 'dart:io';

import 'package:ez_qr/repository/db_backup_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dbBackupNotifier = AsyncNotifierProvider<DBBackupNotifier, void>(
  DBBackupNotifier.new,
);

class DBBackupNotifier extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<File?> backupDatabase() async {
    File? file;
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      file = await ref.watch(dbBackupRepoProvider).backupDatabase();
    });

    return file;
  }

  Future<void> restoreDatabase(String backupPath) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.watch(dbBackupRepoProvider).restoreDatabase(backupPath);
    });
  }
}
