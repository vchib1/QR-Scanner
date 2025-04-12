import 'package:ez_qr/utils/enums/qr_type.dart';
import 'package:flutter/material.dart';

import '../../l10n/generated/app_localizations.dart';

extension QrTypeExtension on QrType {
  String localizedName(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
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
