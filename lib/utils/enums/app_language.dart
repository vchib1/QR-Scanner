enum AppLanguage {
  arabic("ar"),
  bengali("bn"),
  chinese("zh"),
  english('en'),
  french('fr'),
  german('de'),
  hindi('hi'),
  italian('it'),
  japanese('ja'),
  korean('ko'),
  marathi('mr'),
  portuguese('pt'),
  russian('ru'),
  spanish('es'),
  tamil('ta'),
  telugu('te'),
  urdu('ur');

  final String code;

  const AppLanguage(this.code);

  String get nameCapitalized {
    final name = this.name;
    return name[0].toUpperCase() + name.substring(1);
  }

  static AppLanguage fromCode(String code) {
    return AppLanguage.values.firstWhere(
      (lang) => lang.code == code,
      orElse: () => AppLanguage.english,
    );
  }
}
