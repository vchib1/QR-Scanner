import 'dart:io';
import 'package:ez_qr/utils/enums/app_language.dart';
import 'package:ez_qr/utils/enums/theme_contrast.dart';
import 'package:ez_qr/utils/extensions/context_extension.dart';
import 'package:ez_qr/utils/helper_functions/loading_dialog.dart';
import 'package:ez_qr/utils/snackbar.dart';
import 'package:ez_qr/utils/tile_shapes.dart';
import 'package:ez_qr/views/history/provider/provider.dart';
import 'package:ez_qr/views/settings/provider/language/language_provider.dart';
import 'package:ez_qr/views/settings/provider/theme/provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'provider/backup/backup_provider.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(context.locale.settings)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(context, context.locale.app),
              const SizedBox(height: 8.0),

              Consumer(
                builder: (context, ref, child) {
                  final state = ref.watch(themeProvider);

                  return Column(
                    children: [
                      // Theme Mode
                      ListTile(
                        shape: topRoundedBorder(),
                        leading: const Icon(Icons.brightness_6_outlined),
                        title: Text(context.locale.themeTitle),
                        subtitle: Text(context.locale.themeSubtitle),
                        trailing: SegmentedButton(
                          selected: {state.themeMode},
                          onSelectionChanged: (data) {
                            ref
                                .read(themeProvider.notifier)
                                .updateState(
                                  state.copyWith(themeMode: data.first),
                                );
                          },
                          showSelectedIcon: false,
                          style: const ButtonStyle(
                            padding: WidgetStatePropertyAll(
                              EdgeInsets.symmetric(horizontal: 0.0),
                            ),
                            iconSize: WidgetStatePropertyAll(16.0),
                            maximumSize: WidgetStatePropertyAll(
                              Size.square(16.0),
                            ),
                            visualDensity: VisualDensity(horizontal: -4),
                            enableFeedback: true,
                          ),
                          segments: [
                            ButtonSegment(
                              tooltip: context.locale.system,
                              value: ThemeMode.system,
                              icon: const Icon(Icons.brightness_auto),
                            ),
                            ButtonSegment(
                              tooltip: context.locale.light,
                              value: ThemeMode.light,
                              icon: const Icon(Icons.brightness_high_rounded),
                            ),
                            ButtonSegment(
                              tooltip: context.locale.dark,
                              value: ThemeMode.dark,
                              icon: const Icon(Icons.dark_mode),
                            ),
                          ],
                        ),
                      ),

                      // Theme Contrast Mode
                      ListTile(
                        shape: noneBorder(),
                        leading: const Icon(Icons.contrast),
                        title: Text(context.locale.contrastTitle),
                        subtitle: Text(context.locale.contrastSubtitle),
                        trailing: SegmentedButton(
                          selected: {state.contrastMode},
                          onSelectionChanged: (data) {
                            ref
                                .read(themeProvider.notifier)
                                .updateState(
                                  state.copyWith(contrastMode: data.first),
                                );
                          },
                          showSelectedIcon: false,
                          style: const ButtonStyle(
                            padding: WidgetStatePropertyAll(
                              EdgeInsets.symmetric(horizontal: 0.0),
                            ),
                            iconSize: WidgetStatePropertyAll(16.0),
                            maximumSize: WidgetStatePropertyAll(
                              Size.square(16.0),
                            ),
                            visualDensity: VisualDensity(horizontal: -4),
                            enableFeedback: true,
                          ),
                          segments: [
                            ButtonSegment(
                              tooltip: context.locale.low,
                              value: ThemeContrastMode.light,
                              label: const Text("L"),
                            ),
                            ButtonSegment(
                              tooltip: context.locale.medium,
                              value: ThemeContrastMode.medium,
                              label: const Text("M"),
                            ),
                            ButtonSegment(
                              tooltip: context.locale.high,
                              value: ThemeContrastMode.high,
                              label: const Text("H"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),

              // Language
              Consumer(
                builder: (context, ref, child) {
                  final lang = ref.watch(languageNotifierProvider);

                  return ListTile(
                    onTap: () => _showLanguageDialog(context, ref),
                    shape: bottomRoundedBorder(),
                    leading: const Icon(Icons.language_sharp),
                    title: Text(context.locale.languageTitle),
                    subtitle: Text(context.locale.languageSubtitle),
                    trailing: Text(lang.code.toUpperCase()),
                  );
                },
              ),

              const SizedBox(height: 16.0),

              _buildTitle(context, context.locale.data),
              const SizedBox(height: 8.0),

              // Backup Data
              ListTile(
                shape: topRoundedBorder(),
                onTap: () => _backupDatabase(context, ref),
                leading: const Icon(Icons.backup_table),
                title: Text(context.locale.backupDataTitle),
                subtitle: Text(context.locale.backupDataSubtitle),
              ),

              // Restore Data
              ListTile(
                shape: noneBorder(),
                onTap: () => _showRestoreDBDialog(context, ref),
                leading: const Icon(Icons.restore),
                title: Text(context.locale.restoreDataTitle),
                subtitle: Text(context.locale.restoreDataSubtitle),
              ),

              // Delete Data
              ListTile(
                shape: bottomRoundedBorder(),
                onTap: () => _showDeleteDBDialog(context, ref),
                leading: const Icon(Icons.delete_rounded),
                title: Text(context.locale.deleteDataTitle),
                subtitle: Text(context.locale.deleteDataSubtitle),
              ),

              const SizedBox(height: 16.0),
              _buildTitle(context, context.locale.about),
              const SizedBox(height: 8.0),

              // Privacy Policy
              ListTile(
                shape: topRoundedBorder(),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(context.locale.privacyPolicyTitle),
                        content: Text(context.locale.privacyPolicySubtitle),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(context.locale.close),
                          ),
                        ],
                      );
                    },
                  );
                },
                leading: const Icon(Icons.policy),
                title: Text(context.locale.privacyPolicyTitle),
                subtitle: Text(context.locale.privacyPolicySubtitle),
              ),

              // Licenses
              ListTile(
                shape: noneBorder(),
                onTap:
                    () => showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Theme(
                          data: Theme.of(
                            context,
                          ).copyWith(listTileTheme: const ListTileThemeData()),
                          child: AboutDialog(
                            applicationIcon: const Icon(Icons.code),
                            applicationLegalese: '© ${DateTime.now().year}',
                            applicationName: context.locale.licensesTitle,
                            applicationVersion: '1.0',
                          ),
                        );
                      },
                    ),
                leading: const Icon(Icons.library_books),
                title: Text(context.locale.licensesTitle),
                subtitle: Text(context.locale.licensesSubtitle),
              ),

              // Bug Report
              ListTile(
                shape: bottomRoundedBorder(),
                onTap: () => _reportBugDialog(context),
                leading: const Icon(Icons.pest_control_sharp),
                title: Text(context.locale.reportBugTitle),
                subtitle: Text(context.locale.reportBugSubtitle),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
        fontSize: 20.0,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  Future<void> _backupDatabase(BuildContext context, WidgetRef ref) async {
    try {
      final notifier = ref.read(dbBackupNotifier.notifier);
      final dbFile = await notifier.backupDatabase();

      if (dbFile != null) {
        String? savedPath = await FilePicker.platform.saveFile(
          type: FileType.custom,
          fileName: "qr_backup.db",
          allowedExtensions: ["db"],
          bytes: dbFile.readAsBytesSync(),
        );

        if (savedPath == null) return;
      }

      final state = ref.read(dbBackupNotifier);

      if (!context.mounted) return;

      state.whenOrNull(
        data: (_) => SnackBarUtils.showSuccessBar(context.locale.backupSuccess),
        error:
            (e, _) => SnackBarUtils.showErrorBar(
              "${context.locale.backupFailed}: ${e.toString()}",
            ),
      );
    } catch (e) {
      SnackBarUtils.showErrorBar(e.toString());
    }
  }

  Future<void> _showRestoreDBDialog(BuildContext context, WidgetRef ref) async {
    bool? proceed = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              const Icon(Icons.settings_backup_restore),
              Text(context.locale.restoreDataTitle),
            ],
          ),
          content: Text(context.locale.restoreDataWarning),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(context.locale.cancel),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(context.locale.proceed),
            ),
          ],
        );
      },
    );

    if (!(proceed ?? true)) return;

    try {
      if (!context.mounted) return;
      showLoadingDialog(context);
      await _restoreBackupDatabase(context, ref);
    } finally {
      // pop loading dialog
      if (context.mounted) {
        Navigator.pop(context);
      }
    }
  }

  Future<void> _restoreBackupDatabase(
    BuildContext context,
    WidgetRef ref,
  ) async {
    try {
      FilePickerResult? files = await FilePicker.platform.pickFiles(
        type: FileType.any,
      );

      if (files == null) return;

      File pickedFile = File(files.files.first.path!);

      if (pickedFile.path.split(".").last != "db" && context.mounted) {
        throw context.locale.backupInvalidFile;
      }

      final notifier = ref.watch(dbBackupNotifier.notifier);

      await notifier.restoreDatabase(pickedFile.path);

      final state = ref.read(dbBackupNotifier);

      state.whenOrNull(
        data: (_) async {
          if (context.mounted) {
            SnackBarUtils.showSuccessBar(context.locale.restoreSuccess);
          }

          await ref.watch(historyAsyncProvider.notifier).refresh();
        },
        error: (e, _) => throw "${context.locale.restoreFailed}: $e",
      );
    } catch (e) {
      SnackBarUtils.showErrorBar("$e");
    }
  }

  Future<void> _reportBugDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              const Icon(Icons.bug_report_sharp),
              Flexible(child: Text(context.locale.reportBugDialogHeading)),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.locale.reportBugDialogTitle,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8.0),
              Text(
                context.locale.reportBugDialogSubtitle,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(context.locale.cancel),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                // todo: add github repo url
                // Replace with your GitHub issues URL
                launchUrl(
                  Uri.parse("https://github.com/vchib1"),
                  mode: LaunchMode.externalApplication,
                );
              },
              child: Text(context.locale.proceed),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showDeleteDBDialog(BuildContext context, WidgetRef ref) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              const Icon(Icons.warning_outlined),
              Text(context.locale.deleteDataTitle),
            ],
          ),
          content: Text(
            context.locale.deleteDataWarning,
            style: const TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(context.locale.cancel),
            ),
            TextButton(
              onPressed: () {
                ref.read(historyAsyncProvider.notifier).clearHistory();
                Navigator.pop(context);
              },
              child: Text(context.locale.ok),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showLanguageDialog(BuildContext context, WidgetRef ref) async {
    AppLanguage selectedLanguage = ref.read(languageNotifierProvider);

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            spacing: 8.0,
            children: [
              const Icon(Icons.language),
              Text(context.locale.languageTitle),
            ],
          ),
          content: StatefulBuilder(
            builder: (context, setState) {
              return SizedBox(
                height: MediaQuery.sizeOf(context).height * .50,
                width: MediaQuery.sizeOf(context).width * .75,
                child: ListView.builder(
                  shrinkWrap: false,
                  itemCount: AppLanguage.values.length,
                  itemBuilder: (context, index) {
                    final lang = AppLanguage.values[index];

                    return RadioListTile<AppLanguage>(
                      value: lang,
                      groupValue: selectedLanguage,
                      onChanged: (AppLanguage? newLang) {
                        if (newLang == null) return;

                        setState(() {
                          selectedLanguage = newLang;
                        });
                      },
                      title: Text(lang.nameCapitalized),
                    );
                  },
                ),
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(context.locale.cancel),
            ),
            TextButton(
              onPressed: () {
                ref
                    .read(languageNotifierProvider.notifier)
                    .changeLanguage(selectedLanguage);
                Navigator.pop(context);
              },
              child: Text(context.locale.ok),
            ),
          ],
        );
      },
    );
  }
}
