import 'package:ez_qr/model/scanned_item_model.dart';
import 'package:ez_qr/services/database/history/history_db.dart';
import 'package:ez_qr/utils/enums/sort.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final historyRepoProvider = Provider<HistoryRepo>(
  (ref) => HistoryRepo(historyDB: ref.watch(historyDBProvider)),
);

class HistoryRepo {
  final HistoryDB historyDB;

  const HistoryRepo({required this.historyDB});

  // get scanned Items
  Future<List<ScannedItem>> getScannedItems() async {
    final rawRes = await historyDB.getScannedItems();

    return rawRes.map((e) => ScannedItem.fromMap(e)).toList();
  }

  Future<List<ScannedItem>> getFilteredScannedItems({
    Sort sortBy = Sort.asc,
    DateTime? from,
    DateTime? to,
  }) async {
    final rawRes = await historyDB.getFilteredScannedItems(
      sortBy: sortBy,
      from: from,
      to: to,
    );

    return rawRes.map((e) => ScannedItem.fromMap(e)).toList();
  }

  // add scanned item
  Future<void> addScannedItem(ScannedItem item) =>
      historyDB.addScannedItem(item);

  // remove scanned item
  Future<void> removeScannedItem(ScannedItem item) =>
      historyDB.removeScannedItem(item);

  Future<void> clearHistory() => historyDB.clearHistory();

  Future<void> removeSelectedScannedItems(List<String> ids) =>
      historyDB.removeSelectedScannedItems(ids);
}
