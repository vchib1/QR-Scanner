import 'package:ez_qr/views/settings/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingsProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.brightness_6_outlined),
              title: Text("Theme"),
              subtitle: Text("Pick a theme"),
              trailing: SegmentedButton(
                selected: {state.themeMode},
                onSelectionChanged: (data) {
                  ref
                      .read(settingsProvider.notifier)
                      .updateSetting(state.copyWith(themeMode: data.first));
                },
                showSelectedIcon: false,
                style: ButtonStyle(
                  padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 0.0),
                  ),
                  iconSize: WidgetStatePropertyAll(16.0),
                  maximumSize: WidgetStatePropertyAll(Size.square(16.0)),
                  visualDensity: VisualDensity(horizontal: -4),
                  enableFeedback: true,
                ),
                segments: [
                  ButtonSegment(
                    tooltip: "System",
                    value: ThemeMode.system,
                    icon: Icon(Icons.brightness_auto),
                  ),
                  ButtonSegment(
                    tooltip: "Light",
                    value: ThemeMode.light,
                    icon: Icon(Icons.light_mode_rounded),
                  ),
                  ButtonSegment(
                    tooltip: "Dark",
                    value: ThemeMode.dark,
                    icon: Icon(Icons.dark_mode),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
