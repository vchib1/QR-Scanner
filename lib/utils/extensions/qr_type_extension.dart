import 'package:ez_qr/utils/enums/qr_type.dart';
import 'package:ez_qr/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';

extension QrTypeExtension on QrType {
  /// Returns the localised name of the [QrType].
  String localizedName(BuildContext context) {
    final l10n = context.locale;
    switch (this) {
      case QrType.text:
        return l10n.text;
      case QrType.mail:
        return l10n.mail;
      case QrType.url:
        return l10n.url;
      case QrType.phone:
        return l10n.phone;
      case QrType.sms:
        return l10n.sms;
    }
  }
}
