import 'package:collection/collection.dart';
import 'package:ez_qr/model/scanned_item_model.dart';
import 'package:ez_qr/repository/history_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final historyViewModel =
    AsyncNotifierProvider<HistoryViewModel, Map<String, List<ScannedItem>>>(
      HistoryViewModel.new,
    );

class HistoryViewModel extends AsyncNotifier<Map<String, List<ScannedItem>>> {
  late HistoryRepo historyRepo;

  @override
  Future<Map<String, List<ScannedItem>>> build() async {
    historyRepo = ref.watch(historyRepoProvider);
    final items = await historyRepo.getScannedItems();

    return _groupByDate(items);
  }

  Future<void> addItem(ScannedItem item) async {
    await historyRepo.addScannedItem(item);
    state = AsyncValue.data(await build());
  }

  Future<void> removeItem(ScannedItem item) async {
    await historyRepo.removeScannedItem(item);
    state = AsyncValue.data(await build());
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
        return DateFormat("dd-MM-yyyy").format(itemDate);
      }
    });
  }
}
