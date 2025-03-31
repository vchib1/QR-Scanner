import 'package:flutter/material.dart';

void showLoadingDialog(BuildContext context) => showDialog<void>(
  context: context,
  barrierDismissible: false,
  builder: (context) => const Center(child: CircularProgressIndicator()),
);