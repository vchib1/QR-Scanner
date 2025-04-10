import 'package:ez_qr/utils/enums/qr_type.dart';
import 'package:ez_qr/utils/helper_functions/qr_data_dialog.dart';
import 'package:ez_qr/views/history/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryPage extends ConsumerWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final history = ref.watch(historyAsyncProvider);
    final historyVM = ref.watch(historyAsyncProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text("History")),
      body: history.when(
        data: (groupedHistory) {
          if (groupedHistory.isEmpty) {
            return Center(
              child: Column(
                spacing: 8.0,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.history_sharp, size: 48.0),
                  Text(
                    "No History",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            shrinkWrap: true,
            itemCount: groupedHistory.length,
            itemBuilder: (context, index) {
              final date = groupedHistory.keys.elementAt(index);
              final items = groupedHistory[date]!;

              final firstIdx = index == 0;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section Header (Date)
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, firstIdx ? 0 : 12, 8, 8),
                    child: Text(
                      date,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // List of Items for this Date
                  ...items.asMap().entries.map((entry) {
                    final index = entry.key;
                    final item = entry.value;
                    final isFirst = index == 0;
                    final isLast = index == items.length - 1;
                    final isSingle = items.length == 1;

                    return Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0.0),
                      child: ListTile(
                        onTap: () => showQRDataDialog(context, data: item.data),
                        leading: Icon(Icons.qr_code_rounded),
                        title: Text(QrType.getQrType(item.data).getName),
                        subtitle: Text(
                          item.data,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: IconButton(
                          onPressed: () => historyVM.removeItem(item),
                          icon: Icon(Icons.delete),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              isFirst || isSingle ? 8.0 : 0,
                            ),
                            topRight: Radius.circular(
                              isFirst || isSingle ? 8.0 : 0,
                            ),
                            bottomLeft: Radius.circular(
                              isLast || isSingle ? 8.0 : 0,
                            ),
                            bottomRight: Radius.circular(
                              isLast || isSingle ? 8.0 : 0,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 8.0),
                ],
              );
            },
          );
        },
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        loading:
            () =>
                const Center(child: CircularProgressIndicator(year2023: false)),
      ),
    );
  }
}
