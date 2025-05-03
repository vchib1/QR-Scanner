import 'package:ez_qr/utils/extensions/context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:qr_flutter/qr_flutter.dart';

extension EyeShapeExtension on QrEyeShape {
  String localizedName(BuildContext context) {
    final l10n = context.locale;
    switch (this) {
      case QrEyeShape.circle:
        return l10n.circle;
      case QrEyeShape.square:
        return l10n.square;
    }
  }
}
