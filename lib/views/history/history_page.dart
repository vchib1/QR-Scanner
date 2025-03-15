import 'package:ez_qr/utils/enums/qr_type.dart';
import 'package:ez_qr/views/history/viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryPage extends ConsumerWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final history = ref.watch(historyViewModel);
    final historyVM = ref.watch(historyViewModel.notifier);

    return Scaffold(
      appBar: AppBar(title: Text("History")),
      body: history.when(
        data: (historyItems) {
          return ListView.builder(
            itemCount: historyItems.length,
            itemBuilder: (context, index) {
              final item = historyItems[index];

              return ListTile(
                onLongPress: () => historyVM.removeItem(item),
                leading: CircleAvatar(
                  child: Text(
                    QrType.getQrType(item.data).getName,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                title: Text(item.data),
              );
            },
          );
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
