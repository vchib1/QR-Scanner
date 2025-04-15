import 'package:ez_qr/services/shared_pref.dart';
import 'package:ez_qr/utils/enums/app_language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final languageNotifierProvider =
    NotifierProvider<LanguageNotifierProvider, AppLanguage>(
      LanguageNotifierProvider.new,
    );

class LanguageNotifierProvider extends Notifier<AppLanguage> {
  late SharedPreferences _prefs;

  @override
  AppLanguage build() {
    _prefs = ref.read(sharedPrefProvider);
    final savedCode = _prefs.getString('language_code');
    debugPrint("Initialized: Language Notifier");
    return AppLanguage.fromCode(savedCode ?? AppLanguage.english.code);
  }

  void changeLanguage(AppLanguage newLang) {
    state = newLang;
    _prefs.setString('language_code', newLang.code);
  }
}
