import 'package:ez_qr/utils/enums/qr_type.dart';
import 'package:ez_qr/utils/helper_functions/qr_data_dialog.dart';
import 'package:ez_qr/views/history/viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
            reverse: true,
            shrinkWrap: true,
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
                  ...items.asMap().entries.map((entry) {
                    final index = entry.key;
                    final item = entry.value;
                    final isFirst = index == 0;
                    final isLast = index == items.length - 1;
                    final isSingle = items.length == 1;

                    return Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 4.0),
                      child: ListTile(
                        onTap: () => showQRDataDialog(context, data: item.data),
                        leading: QrImageView(
                          data: item.data,
                          size: 50,
                          backgroundColor: Colors.white,
                        ),
                        title: Text(QrType.getQrType(item.data).getName),
                        subtitle: Text(item.data),
                        trailing: IconButton(
                          onPressed: () => historyVM.removeItem(item),
                          icon: Icon(Icons.delete),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              isFirst || isSingle ? 16.0 : 0,
                            ),
                            topRight: Radius.circular(
                              isFirst || isSingle ? 16.0 : 0,
                            ),
                            bottomLeft: Radius.circular(
                              isLast || isSingle ? 16.0 : 0,
                            ),
                            bottomRight: Radius.circular(
                              isLast || isSingle ? 16.0 : 0,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
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
