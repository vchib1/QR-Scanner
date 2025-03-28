import 'dart:io';

import 'package:ez_qr/views/editor/viewmodel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class LogoPickerPage extends StatefulWidget {
  const LogoPickerPage({super.key});

  @override
  State<LogoPickerPage> createState() => _LogoPickerPageState();
}

class _LogoPickerPageState extends State<LogoPickerPage> {
  QRLogoSize logoSize = QRLogoSize.large;

  String? imagePath;

  Future<void> pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result == null) return;

    imagePath = result.files.first.path;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: pickImage),
      appBar: AppBar(title: Text("Logo Picker")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                color: Colors.red,
                image:
                    imagePath != null
                        ? DecorationImage(
                          image: FileImage(File(imagePath!)),
                          fit: BoxFit.cover,
                        )
                        : null,
              ),
            ),
            const SizedBox(height: 16.0),
            ListTile(
              title: Text("Select Logo Size"),
              subtitle: Text("Please pick a suitable logo size."),
              trailing: SegmentedButton<QRLogoSize>(
                direction: Axis.horizontal,
                style: ButtonStyle(
                  padding: WidgetStateProperty.all(const EdgeInsets.all(0.0)),
                  fixedSize: WidgetStateProperty.all(Size(32.0, 16.0)),
                  shape: WidgetStateProperty.all(
                    const RoundedRectangleBorder(),
                  ),
                ),
                segments:
                    QRLogoSize.values
                        .map(
                          (e) => ButtonSegment(
                            value: e,
                            label: Text(e.size.toString()),
                          ),
                        )
                        .toList(),
                selected: {logoSize},
                onSelectionChanged: (newSelection) {
                  setState(() {
                    logoSize = newSelection.first;
                  });
                },
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed:
                  (imagePath != null)
                      ? () => Navigator.pop(context, {
                        "path": imagePath,
                        "size": logoSize,
                      })
                      : null,
              child: const Text("Confirm"),
            ),
          ],
        ),
      ),
    );
  }
}
