import 'dart:io';
import 'package:ez_qr/utils/enums/theme_contrast.dart';
import 'package:ez_qr/utils/helper_functions/loading_dialog.dart';
import 'package:ez_qr/utils/snackbar.dart';
import 'package:ez_qr/utils/tile_shapes.dart';
import 'package:ez_qr/views/history/provider/provider.dart';
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
      appBar: AppBar(title: const Text("Settings")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(context, "Theme"),
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
                        title: const Text("Theme"),
                        subtitle: const Text("Theme Mode"),
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
                          segments: const [
                            ButtonSegment(
                              tooltip: "System",
                              value: ThemeMode.system,
                              icon: Icon(Icons.brightness_auto),
                            ),
                            ButtonSegment(
                              tooltip: "Light",
                              value: ThemeMode.light,
                              icon: Icon(Icons.brightness_high_rounded),
                            ),
                            ButtonSegment(
                              tooltip: "Dark",
                              value: ThemeMode.dark,
                              icon: Icon(Icons.dark_mode),
                            ),
                          ],
                        ),
                      ),

                      // Theme Contrast Mode
                      ListTile(
                        shape: bottomRoundedBorder(),
                        leading: const Icon(Icons.contrast),
                        title: const Text("Contrast"),
                        subtitle: const Text("Theme contrast"),
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
                          segments: const [
                            ButtonSegment(
                              tooltip: "Light",
                              value: ThemeContrastMode.light,
                              label: Text("L"),
                            ),
                            ButtonSegment(
                              tooltip: "Medium",
                              value: ThemeContrastMode.medium,
                              label: Text("M"),
                            ),
                            ButtonSegment(
                              tooltip: "High",
                              value: ThemeContrastMode.high,
                              label: Text("H"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 16.0),

              _buildTitle(context, "Data"),
              const SizedBox(height: 8.0),

              // Backup Data
              ListTile(
                shape: topRoundedBorder(),
                onTap: () => _backupDatabase(ref),
                leading: const Icon(Icons.backup_table),
                title: const Text("Backup Data"),
                subtitle: const Text("Create a backup file in your device"),
              ),

              // Restore Data
              ListTile(
                shape: bottomRoundedBorder(),
                onTap: () => _showRestoreDBDialog(context, ref),
                leading: const Icon(Icons.restore),
                title: const Text("Restore Data"),
                subtitle: const Text("Restore backup from your device"),
              ),

              const SizedBox(height: 16.0),
              _buildTitle(context, "About"),
              const SizedBox(height: 8.0),

              // Privacy Policy
              ListTile(
                shape: topRoundedBorder(),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Privacy Policy"),
                        content: const Text("Read our privacy policy"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Close"),
                          ),
                        ],
                      );
                    },
                  );
                },
                leading: const Icon(Icons.policy),
                title: const Text("Privacy Policy"),
                subtitle: const Text("Click here to read our privacy policy"),
              ),

              // Licenses
              ListTile(
                shape: noneBorder(),
                onTap:
                    () => showDialog(
                      context: context,
                      builder:
                          (BuildContext context) => AboutDialog(
                            applicationIcon: const Icon(Icons.code),
                            applicationLegalese:
                                '© ${DateTime.now().year} Only Flutter',
                            applicationName: 'Licenses Demo',
                            applicationVersion: '1.0',
                          ),
                    ),
                leading: const Icon(Icons.library_books),
                title: const Text("Licenses"),
                subtitle: const Text("Click here to view the licenses"),
              ),

              // Bug Report
              ListTile(
                shape: bottomRoundedBorder(),
                onTap: () => _reportBugDialog(context),
                leading: const Icon(Icons.pest_control_sharp),
                title: const Text("Bug Report"),
                subtitle: const Text("Report a bug on GitHub"),
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

  Future<void> _backupDatabase(WidgetRef ref) async {
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

      state.whenOrNull(
        data: (_) => SnackBarUtils.showSuccessBar("Backup successful!"),
        error:
            (e, _) =>
                SnackBarUtils.showErrorBar("Backup failed: ${e.toString()}"),
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
          title: const Row(
            spacing: 8.0,
            children: [
              Icon(Icons.settings_backup_restore),
              Text("Restore Data"),
            ],
          ),
          content: const Text(
            "This process will overwrite the existing data. Are you sure you want to proceed?",
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text("Proceed"),
            ),
          ],
        );
      },
    );

    if (!(proceed ?? true)) return;

    try {
      if (!context.mounted) return;
      showLoadingDialog(context);
      await _restoreBackupDatabase(ref);
    } finally {
      // pop loading dialog
      if (context.mounted) {
        Navigator.pop(context);
      }
    }
  }

  Future<void> _restoreBackupDatabase(WidgetRef ref) async {
    try {
      FilePickerResult? files = await FilePicker.platform.pickFiles(
        dialogTitle: "Pick backup file",
        type: FileType.any,
      );

      if (files == null) return;

      File pickedFile = File(files.files.first.path!);

      if (pickedFile.path.split(".").last != "db") {
        throw "Please pick a valid file with .db extension.";
      }

      final notifier = ref.watch(dbBackupNotifier.notifier);

      await notifier.restoreDatabase(pickedFile.path);

      final state = ref.read(dbBackupNotifier);

      state.whenOrNull(
        data: (_) async {
          SnackBarUtils.showSuccessBar("Backup Restored!");

          await ref.watch(historyAsyncProvider.notifier).refresh();
        },
        error: (e, _) => throw e,
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
          title: const Row(
            spacing: 8.0,
            children: [Icon(Icons.bug_report_sharp), Text("Report a Bug")],
          ),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Would you like to report a bug on GitHub?",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8.0),
              Text(
                "This will open our GitHub issues page where you can describe the problem you encountered.",
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
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
              child: const Text("Open"),
            ),
          ],
        );
      },
    );
  }
}
