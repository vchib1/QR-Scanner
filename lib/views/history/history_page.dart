import 'package:ez_qr/model/scanned_item_model.dart';
import 'package:ez_qr/utils/enums/qr_type.dart';
import 'package:ez_qr/utils/extensions/context_extension.dart';
import 'package:ez_qr/utils/extensions/qr_type_extension.dart';
import 'package:ez_qr/utils/helper_functions/qr_data_dialog.dart';
import 'package:ez_qr/utils/helper_functions/share_qr_image.dart';
import 'package:ez_qr/utils/snackbar.dart';
import 'package:ez_qr/views/history/provider/provider.dart';
import 'package:ez_qr/views/settings/provider/language/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import "package:collection/collection.dart";

class HistoryPage extends ConsumerStatefulWidget {
  const HistoryPage({super.key});

  @override
  ConsumerState<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends ConsumerState<HistoryPage>
    with TickerProviderStateMixin {
  //
  late AnimationController scaleController;
  late AnimationController slideController;
  late Animation<double> scaleAnimation;
  late Animation<Offset> slideUpAnimation;

  final Set<ScannedItem> _selectedItems = {};

  bool get selectionMode => _selectedItems.isNotEmpty;

  @override
  void initState() {
    super.initState();

    scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
      reverseDuration: const Duration(milliseconds: 150),
    );

    slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
      reverseDuration: const Duration(milliseconds: 150),
    );

    scaleAnimation = CurvedAnimation(
      parent: scaleController,
      curve: Curves.easeIn,
      reverseCurve: Curves.easeOut,
    );

    slideUpAnimation = Tween(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: slideController,
        curve: Curves.easeIn,
        reverseCurve: Curves.easeOut,
      ),
    );
  }

  @override
  void dispose() {
    scaleController.dispose();
    slideController.dispose();
    super.dispose();
  }

  Future<void> playForwardAnimation() async {
    await scaleController.forward();
    await slideController.forward();
  }

  Future<void> playReverseAnimation() async {
    await slideController.reverse();
    await scaleController.reverse();
  }

  void _toggleSelection(ScannedItem item) {
    setState(() {
      if (_selectedItems.contains(item)) {
        _selectedItems.remove(item);
      } else {
        _selectedItems.add(item);
      }
    });

    selectionMode ? playForwardAnimation() : playReverseAnimation();
  }

  void _clearSelection() {
    setState(() => _selectedItems.clear());
    playReverseAnimation();
  }

  Map<String, List<ScannedItem>> _groupByDate(
    BuildContext context,
    List<ScannedItem> items,
  ) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    final locale = ref.watch(languageNotifierProvider);

    return groupBy(items, (ScannedItem item) {
      final date = item.createdAt;
      final itemDate = DateTime(date.year, date.month, date.day);

      if (itemDate == today) {
        return context.locale.today;
      } else if (itemDate == yesterday) {
        return context.locale.yesterday;
      } else {
        return DateFormat("MMM d, yyyy", locale.code).format(itemDate);
      }
    });
  }

  Future<void> _deleteSelectedItems() async {
    ref
        .read(historyAsyncProvider.notifier)
        .removeSelectedItems(_selectedItems.map((e) => e.id!).toList());

    _clearSelection();
  }

  @override
  Widget build(BuildContext context) {
    final history = ref.watch(historyAsyncProvider);

    return PopScope(
      canPop: !selectionMode,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          _clearSelection();
          return;
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text(context.locale.history)),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.noAnimation,
        floatingActionButton: ScaleTransition(
          scale: scaleAnimation,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlideTransition(
                position: slideUpAnimation,
                child: FloatingActionButton(
                  mini: true,
                  onPressed: _clearSelection,
                  child: const Icon(Icons.clear),
                ),
              ),
              FloatingActionButton(
                onPressed: _deleteSelectedItems,
                child: const Icon(Icons.delete),
              ),
            ],
          ),
        ),

        body: history.when(
          data: (history) {
            final groupedHistory = _groupByDate(context, history);

            if (groupedHistory.isEmpty) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.history_sharp, size: 48.0),
                    Text(
                      context.locale.noHistory,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              );
            }

            return ListView.builder(
              itemCount: groupedHistory.length,
              itemBuilder: (context, index) {
                final date = groupedHistory.keys.elementAt(index);
                final items = groupedHistory[date]!;
                final firstIdx = index == 0;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(8, firstIdx ? 0 : 12, 8, 8),
                      child: Text(
                        date,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    ...items.asMap().entries.map((entry) {
                      final item = entry.value;
                      final isSelected = _selectedItems.contains(item);
                      final isFirst = entry.key == 0;
                      final isLast = entry.key == items.length - 1;
                      final isSingle = items.length == 1;

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ListTile(
                          onLongPress: () => _toggleSelection(item),
                          onTap: () {
                            if (selectionMode) {
                              _toggleSelection(item);
                            } else {
                              _showOptions(context, ref, item: item);
                            }
                          },
                          selected: isSelected,
                          selectedTileColor: Theme.of(context)
                              .colorScheme
                              .surfaceContainerHighest
                              .withValues(alpha: 0.85),
                          leading: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 200),
                            transitionBuilder:
                                (child, anim) =>
                                    ScaleTransition(scale: anim, child: child),
                            child: CircleAvatar(
                              key: ValueKey<bool>(isSelected),
                              child:
                                  isSelected
                                      ? const Icon(Icons.check)
                                      : const Icon(Icons.qr_code_2),
                            ),
                          ),
                          title: Text(
                            QrType.getQrType(item.data).localizedName(context),
                          ),
                          subtitle: Text(
                            item.data,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
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
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }

  void _showOptions(
    BuildContext context,
    WidgetRef ref, {
    required ScannedItem item,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(context.locale.open),
                leading: const Icon(Icons.remove_red_eye_outlined),
                onTap: () {
                  Navigator.pop(context);
                  showQRDataDialog(context, data: item.data);
                },
              ),
              ListTile(
                title: Text(context.locale.copy),
                leading: const Icon(Icons.copy_rounded),
                onTap: () async {
                  await Clipboard.setData(ClipboardData(text: item.data));
                  if (!context.mounted) return;
                  SnackBarUtils.showSnackBar(context.locale.copied);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(context.locale.share),
                leading: const Icon(Icons.share_outlined),
                onTap: () async {
                  await shareQRImage(context, data: item.data);
                  if (!context.mounted) return;
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(context.locale.delete),
                leading: const Icon(Icons.delete),
                onTap: () {
                  Navigator.pop(context);
                  _deleteItemDialog(context, ref, item);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<bool?> _deleteItemDialog(
    BuildContext context,
    WidgetRef ref,
    ScannedItem item,
  ) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(context.locale.deleteItem),
          content: Text(context.locale.deleteItemConfirm),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(context.locale.cancel),
            ),
            TextButton(
              onPressed: () async {
                await ref.read(historyAsyncProvider.notifier).removeItem(item);
                if (!context.mounted) return;
                Navigator.pop(context, true);
              },
              child: Text(context.locale.delete),
            ),
          ],
        );
      },
    );
  }
}
