import 'package:ez_qr/utils/enums/theme_contrast.dart';
import 'package:ez_qr/utils/tile_shapes.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(context, "Appearance"),
            const SizedBox(height: 8.0),

            // Theme Mode
            ListTile(
              shape: topRoundedBorder(),
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
              leading: Icon(Icons.contrast),
              title: Text("Contrast"),
              subtitle: Text("Theme contrast"),
              trailing: SegmentedButton(
                selected: {state.contrastMode},
                onSelectionChanged: (data) {
                  ref
                      .read(settingsProvider.notifier)
                      .updateSetting(state.copyWith(contrastMode: data.first));
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
                      title: Text("Privacy Policy"),
                      content: Text("Read our privacy policy"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("Close"),
                        ),
                      ],
                    );
                  },
                );
              },
              leading: Icon(Icons.policy),
              title: Text("Privacy Policy"),
              subtitle: Text("Click here to read our privacy policy"),
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
              leading: Icon(Icons.library_books),
              title: Text("Licenses"),
              subtitle: Text("Click here to view the licenses"),
            ),

            // Bug Report
            ListTile(
              shape: bottomRoundedBorder(),
              onTap: () {},
              leading: Icon(Icons.pest_control_sharp),
              title: Text("Bug Report"),
              subtitle: Text("Report a bug on GitHub"),
            ),
          ],
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
}
