import 'package:ez_qr/utils/enums/sort.dart';
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

  // add scanned item
  Future<void> addScannedItem(ScannedItem item) async {
    final db = await database;

    await db.insert(history, item.copyWith(id: _uuid.v4()).toMap());
  }

  // remove scanned item
  Future<void> removeScannedItem(ScannedItem item) async {
    final db = await database;

    await db.delete(history, where: "id = ?", whereArgs: [item.id]);
  }

  // remove selected scanned items (by id list)
  Future<void> removeSelectedScannedItems(List<String> ids) async {
    if (ids.isEmpty) return;

    final db = await database;
    final placeholders = List.filled(ids.length, '?').join(', ');
    await db.delete(history, where: 'id IN ($placeholders)', whereArgs: ids);
  }

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

  // get scanned Items
  Future<List<Map<String, Object?>>> getFilteredScannedItems({
    Sort sortBy = Sort.asc,
    DateTime? from,
    DateTime? to,
  }) async {
    try {
      final db = await database;

      List<Map<String, Object?>> result = [];

      final whereClause = <String>[];
      final whereArgs = <Object?>[];

      if (from != null) {
        whereClause.add("createdAt >= ?");
        whereArgs.add(from.millisecondsSinceEpoch);
      }

      if (to != null) {
        whereClause.add("createdAt <= ?");
        whereArgs.add(to.millisecondsSinceEpoch);
      }

      String? whereString =
          whereClause.isNotEmpty ? whereClause.join(" AND ") : null;

      result = await db.query(
        history,
        where: whereString,
        whereArgs: whereArgs,
        orderBy: "createdAt ${sortBy.name.toUpperCase()}",
      );

      return result;
    } catch (_) {
      return [];
    }
  }

  // clear history
  Future<void> clearHistory() async {
    final db = await database;

    await db.delete(history);
  }
}
