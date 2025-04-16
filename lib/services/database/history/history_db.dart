import 'package:uuid/uuid.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ez_qr/model/scanned_item_model.dart';
import 'package:ez_qr/services/database/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final historyDBProvider = Provider<HistoryDB>(
  (ref) =>
      HistoryDB(db: ref.watch(databaseProvider), uuid: ref.watch(uuidProvider)),
);

final uuidProvider = Provider<Uuid>((ref) => const Uuid());

class HistoryDB {
  final LocalDatabase _db;
  final Uuid _uuid;

  const HistoryDB({required LocalDatabase db, required Uuid uuid})
    : _db = db,
      _uuid = uuid;

  Future<Database> get database => _db.database;

  // get scanned Items
  Future<List<Map<String, Object?>>> getScannedItems() async {
    try {
      final db = await database;

      final res = await db.query(history, orderBy: "createdAt DESC");

      return res;
    } catch (_) {
      return [];
    }
  }

  // add scanned item
  Future<void> addScannedItem(ScannedItem item) async {
    try {
      final db = await database;

      await db.insert(history, item.copyWith(id: _uuid.v4()).toMap());
    } catch (_) {
      rethrow;
    }
  }

  // remove scanned item
  Future<void> removeScannedItem(ScannedItem item) async {
    try {
      final db = await database;

      await db.delete(history, where: "id = ?", whereArgs: [item.id]);
    } catch (_) {
      rethrow;
    }
  }

  // ✅ remove selected scanned items (by id list)
  Future<void> removeSelectedScannedItems(List<String> ids) async {
    if (ids.isEmpty) return;

    try {
      final db = await database;
      final placeholders = List.filled(ids.length, '?').join(', ');
      await db.delete(history, where: 'id IN ($placeholders)', whereArgs: ids);
    } catch (_) {
      rethrow;
    }
  }

  Future<void> clearHistory() async {
    try {
      final db = await database;

      await db.delete(history);
    } catch (_) {
      rethrow;
    }
  }
}
