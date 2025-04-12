import 'package:ez_qr/l10n/generated/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:qr_flutter/qr_flutter.dart';

extension PattenShapeExtension on QrDataModuleShape {
  String localizedName(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    switch (this) {
      case QrDataModuleShape.circle:
        return l10n.circle;
      case QrDataModuleShape.square:
        return l10n.square;
    }
  }
}
