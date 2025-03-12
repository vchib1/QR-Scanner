import 'package:ez_qr/views/qr_scanner/qr_scanner_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const list = ["Scan a QR", "Generate a QR", "History", "Settings"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ez-QR")),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 30,
          children: [
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                ...list.map(
                  (text) => InkWell(
                    onTap: () {
                      if (text == "Scan a QR") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const QrScannerPage();
                            },
                          ),
                        );
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.center,
                      color: Theme.of(context).colorScheme.primary,
                      width: 150,
                      child: Text(
                        text,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
