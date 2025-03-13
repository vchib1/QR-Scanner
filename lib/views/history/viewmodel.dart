import 'package:ez_qr/model/scanned_item_model.dart';
import 'package:ez_qr/repository/history_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final historyViewModel =
    AsyncNotifierProvider<HistoryViewModel, List<ScannedItem>>(
      HistoryViewModel.new,
    );

class HistoryViewModel extends AsyncNotifier<List<ScannedItem>> {
  late final HistoryRepo historyRepo;

  @override
  Future<List<ScannedItem>> build() async {
    historyRepo = ref.watch(historyRepoProvider);
    return historyRepo.getScannedItems();
  }

  Future<void> addItem(ScannedItem item) async {
    await historyRepo.addScannedItem(item);
    state = AsyncValue.data(
      await historyRepo.getScannedItems(),
    ); // Update state
  }

  Future<void> removeItem(ScannedItem item) async {
    await historyRepo.removeScannedItem(item);
    state = AsyncValue.data(
      await historyRepo.getScannedItems(),
    ); // Update state
  }
}
