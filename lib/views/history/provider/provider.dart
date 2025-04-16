import 'package:ez_qr/model/scanned_item_model.dart';
import 'package:ez_qr/repository/history_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final historyAsyncProvider =
    AsyncNotifierProvider<HistoryAsyncProvider, List<ScannedItem>>(
      HistoryAsyncProvider.new,
    );

class HistoryAsyncProvider extends AsyncNotifier<List<ScannedItem>> {
  late HistoryRepo _historyRepo;

  @override
  Future<List<ScannedItem>> build() async {
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
  Future<List<ScannedItem>> init() async {
    final items = await _historyRepo.getScannedItems();
    return items;
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

  Future<void> clearHistory() async {
    await _historyRepo.clearHistory();
    await refresh();
  }

  Future<void> removeSelectedItems(List<String> ids) async {
    await _historyRepo.removeSelectedScannedItems(ids);
    await refresh();
  }
}
