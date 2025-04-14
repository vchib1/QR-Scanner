import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

Future<void> colorPickerDialog(
  BuildContext context,
  Color color,
  Function(Color color) setState,
) async {
  //
  Color newColor = await showColorPickerDialog(
    context,
    color,
    pickersEnabled: <ColorPickerType, bool>{
      ColorPickerType.wheel: true,
      ColorPickerType.primary: false,
      ColorPickerType.accent: false,
    },
  );

  setState(newColor);
}
