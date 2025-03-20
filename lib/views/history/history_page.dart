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
        data: (groupedHistory) {
          return ListView.builder(
            itemCount: groupedHistory.length,
            itemBuilder: (context, index) {
              final date = groupedHistory.keys.elementAt(index);
              final items = groupedHistory[date]!;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section Header (Date)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      date,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // List of Items for this Date
                  ...items.map(
                    (item) => ListTile(
                      onLongPress: () => historyVM.removeItem(item),
                      leading: CircleAvatar(
                        child: Text(
                          QrType.getQrType(item.data).getName,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ),
                      title: Text(item.data),
                    ),
                  ),
                ],
              );
            },
          );
        },
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
