import 'package:flutter/material.dart';

void showLoadingDialog(BuildContext context) => showDialog<void>(
  context: context,
  barrierDismissible: false,
  builder: (context) {
    double width = 100.0;
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Center(
        child: Container(
          height: width,
          width: width,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHigh,
            borderRadius: BorderRadius.circular(12.0),
          ),
          alignment: Alignment.center,
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  },
);
