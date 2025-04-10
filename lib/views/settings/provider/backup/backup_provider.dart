import 'package:ez_qr/repository/db_backup_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dbBackupNotifier = AsyncNotifierProvider<DBBackupNotifier,void>(
  DBBackupNotifier.new,
);

class DBBackupNotifier extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<void> backupDatabase() async {
    final manager = ref.watch(dbBackupRepoProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await manager.backupDatabase();
    });
  }

  Future<void> restoreDatabase() async {
    final manager = ref.watch(dbBackupRepoProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await manager.restoreDatabase();
    });
  }
}
