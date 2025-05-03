import 'package:ez_qr/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

extension PattenShapeExtension on QrDataModuleShape {
  String localizedName(BuildContext context) {
    final l10n = context.locale;
    switch (this) {
      case QrDataModuleShape.circle:
        return l10n.circle;
      case QrDataModuleShape.square:
        return l10n.square;
    }
  }
}
