import 'package:ez_qr/l10n/generated/app_localizations.dart';
import 'package:flutter/cupertino.dart';

extension BuildContextExtension on BuildContext {
  AppLocalizations get locale {
    AppLocalizations? locale = AppLocalizations.of(this);

    if (locale == null) {
      throw Exception("❌ No AppLocalizations found.");
    }

    return locale;
  }
}
