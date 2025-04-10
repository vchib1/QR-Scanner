import 'package:ez_qr/model/scanned_item_model.dart';
import 'package:ez_qr/repository/history_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import "package:collection/collection.dart";

final historyAsyncProvider =
    AsyncNotifierProvider<HistoryAsyncProvider, Map<String, List<ScannedItem>>>(
      HistoryAsyncProvider.new,
    );

class HistoryAsyncProvider
    extends AsyncNotifier<Map<String, List<ScannedItem>>> {
  late HistoryRepo _historyRepo;

  @override
  Future<Map<String, List<ScannedItem>>> build() async {
    _historyRepo = ref.watch(historyRepoProvider);

    return init();
  }

  Future<void> addItem(ScannedItem item) async {
    await _historyRepo.addScannedItem(item);
    state = AsyncValue.data(await build());
  }

  Future<void> removeItem(ScannedItem item) async {
    await _historyRepo.removeScannedItem(item);
    state = AsyncValue.data(await build());
  }

  // initialize history
  Future<Map<String, List<ScannedItem>>> init() async {
    final items = await _historyRepo.getScannedItems();
    return Future.value(_groupByDate(items));
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    try {
      final refreshedData = await init();
      state = AsyncValue.data(refreshedData);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  /// Groups items by "Today", "Yesterday", or "dd-MM-yyyy"
  Map<String, List<ScannedItem>> _groupByDate(List<ScannedItem> items) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(Duration(days: 1));

    return groupBy(items, (ScannedItem item) {
      final date = item.createdAt;
      final itemDate = DateTime(date.year, date.month, date.day);

      if (itemDate == today) {
        return "Today";
      } else if (itemDate == yesterday) {
        return "Yesterday";
      } else {
        return DateFormat("MMM d, yyyy").format(itemDate);
      }
    });
  }
}
