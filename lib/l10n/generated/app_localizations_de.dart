// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get yes => 'Ja';

  @override
  String get no => 'Nein';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get close => 'Schließen';

  @override
  String get open => 'Öffnen';

  @override
  String get proceed => 'Fortfahren';

  @override
  String get share => 'Teilen';

  @override
  String get copy => 'Kopieren';

  @override
  String get copied => 'Kopiert';

  @override
  String get delete => 'Löschen';

  @override
  String get deleteItem => 'Element löschen';

  @override
  String get deleteItemConfirm => 'Möchten Sie dieses Element wirklich löschen?';

  @override
  String get confirm => 'Bestätigen';

  @override
  String get next => 'Weiter';

  @override
  String get pickFromGallery => 'Aus Galerie wählen';

  @override
  String get system => 'System';

  @override
  String get light => 'Hell';

  @override
  String get dark => 'Dunkel';

  @override
  String get low => 'Niedrig';

  @override
  String get medium => 'Mittel';

  @override
  String get high => 'Hoch';

  @override
  String get app => 'App';

  @override
  String get today => 'Heute';

  @override
  String get yesterday => 'Gestern';

  @override
  String itemCount(Object count) {
    return '$count Elemente';
  }

  @override
  String get deleteAllItems => 'Alle löschen';

  @override
  String get deleteAllItemsWarning => 'Möchten Sie wirklich alle Elemente löschen?';

  @override
  String get home => 'Startseite';

  @override
  String get history => 'Verlauf';

  @override
  String get noHistory => 'Kein Verlauf vorhanden';

  @override
  String get settings => 'Einstellungen';

  @override
  String get scanQRCodeTitle => 'QR-Code scannen';

  @override
  String get scanQRCodeSubtitle => 'Verwenden Sie die Kamera zum Scannen eines QR-Codes.';

  @override
  String get scanImageTitle => 'Bild scannen';

  @override
  String get scanImageSubtitle => 'QR-Code aus einem Bild erkennen.';

  @override
  String get qrGeneratorTitle => 'QR-Generator';

  @override
  String get qrGeneratorSubtitle => 'Erstellen Sie Ihren eigenen QR-Code.';

  @override
  String get text => 'Text';

  @override
  String get mail => 'Mail';

  @override
  String get to => 'An';

  @override
  String get subject => 'Betreff';

  @override
  String get body => 'Nachricht';

  @override
  String get url => 'Link';

  @override
  String get urlError => 'Bitte geben Sie einen gültigen Weblink ein.';

  @override
  String get phone => 'Telefon';

  @override
  String get message => 'Nachricht';

  @override
  String get sms => 'SMS';

  @override
  String get qrEditor => 'QR-Editor';

  @override
  String get bgColorTitle => 'Hintergrundfarbe';

  @override
  String get bgColorSubtitle => 'Wählen Sie eine kontrastreiche Farbe zum Scannen.';

  @override
  String get patternColorTitle => 'Musterfarbe';

  @override
  String get patternColorSubtitle => 'Farbe für Punkte auswählen. Dunkle Farben sind besser lesbar.';

  @override
  String get eyeColorTitle => 'Augenfarbe';

  @override
  String get eyeColorSubtitle => 'Wählen Sie eine Farbe für die Augen in den Ecken.';

  @override
  String get addLogoTitle => 'Logo hinzufügen';

  @override
  String get addLogoSubtitle => 'Fügen Sie ein spezielles Logo in der Mitte des QR hinzu.';

  @override
  String get addLogoWarning => 'Ein Logo kann das Scannen beeinträchtigen.';

  @override
  String get addLogoInvalidError => 'Bitte wählen Sie ein gültiges Logo.';

  @override
  String get logoSizeTitle => 'Logogröße';

  @override
  String get logoSizeSubtitle => 'Größe des Logos festlegen.';

  @override
  String get exportSizeTitle => 'Exportgröße';

  @override
  String get exportSizeSubtitle => 'Größere Größen sind besser für hohe Qualität.';

  @override
  String get enableGapTitle => 'Abstand aktivieren';

  @override
  String get enableGapSubtitle => 'Füge Abstand zwischen Punkten hinzu.';

  @override
  String get patternShape => 'Musterform';

  @override
  String get eyeShape => 'Augenform';

  @override
  String get square => 'Quadrat';

  @override
  String get circle => 'Kreis';

  @override
  String get saveQR => 'QR speichern';

  @override
  String get shareQR => 'QR teilen';

  @override
  String get qrSaved => 'QR wurde gespeichert';

  @override
  String get imageNotExists => 'Bild existiert nicht.';

  @override
  String get imagePickFailed => 'Bild konnte nicht ausgewählt werden.';

  @override
  String get noQRFound => 'Kein QR-Code gefunden.';

  @override
  String get themeTitle => 'Design';

  @override
  String get themeSubtitle => 'Designmodus';

  @override
  String get contrastTitle => 'Kontrast';

  @override
  String get contrastSubtitle => 'Kontraststufe des Designs';

  @override
  String get languageTitle => 'Sprache';

  @override
  String get languageSubtitle => 'Bevorzugte Sprache auswählen';

  @override
  String get data => 'Daten';

  @override
  String get backupDataTitle => 'Daten sichern';

  @override
  String get backupDataSubtitle => 'Sichern Sie Ihre Daten lokal auf dem Gerät.';

  @override
  String get restoreDataTitle => 'Daten wiederherstellen';

  @override
  String get restoreDataSubtitle => 'Daten von einer Sicherungsdatei auf dem Gerät wiederherstellen.';

  @override
  String get restoreDataWarning => 'Diese Aktion überschreibt vorhandene Daten. Möchten Sie fortfahren?';

  @override
  String get backupSuccess => 'Sicherung erfolgreich';

  @override
  String get backupFailed => 'Sicherung fehlgeschlagen';

  @override
  String get restoreSuccess => 'Daten erfolgreich wiederhergestellt';

  @override
  String get restoreFailed => 'Wiederherstellung der Daten fehlgeschlagen';

  @override
  String get backupInvalidFile => 'Bitte wählen Sie eine gültige .db-Datei.';

  @override
  String get deleteDataTitle => 'Daten löschen';

  @override
  String get deleteDataSubtitle => 'Gespeicherte Verlaufseinträge löschen.';

  @override
  String get deleteDataWarning => 'Der gesamte Verlauf wird dauerhaft gelöscht und kann nicht wiederhergestellt werden.';

  @override
  String get about => 'Über';

  @override
  String get privacyPolicyTitle => 'Datenschutzrichtlinie';

  @override
  String get privacyPolicySubtitle => 'Tippen Sie hier, um unsere Datenschutzrichtlinie zu lesen.';

  @override
  String get licensesTitle => 'Lizenzen';

  @override
  String get licensesSubtitle => 'Tippen Sie hier, um Lizenzen einzusehen.';

  @override
  String get reportBugTitle => 'Fehler melden';

  @override
  String get reportBugSubtitle => 'Melden Sie einen Fehler auf GitHub.';

  @override
  String get reportBugDialogHeading => 'Fehler melden';

  @override
  String get reportBugDialogTitle => 'Möchten Sie einen Fehler melden?';

  @override
  String get reportBugDialogSubtitle => 'Sie werden zur GitHub-Issue-Seite weitergeleitet, wo Sie weitere Details angeben können.';

  @override
  String get cameraPermissionRequiredTitle => 'Kamerazugriff erforderlich';

  @override
  String get cameraPermissionRequiredSubtitle => 'Zum Scannen von QR-Codes ist Kamerazugriff erforderlich. Bitte erlauben Sie den Zugriff.';

  @override
  String get cameraPermissionDeniedTitle => 'Kamerazugriff dauerhaft verweigert';

  @override
  String get cameraPermissionDeniedSubtitle => 'Zum Scannen von QR-Codes ist Kamerazugriff erforderlich. Bitte erlauben Sie den Zugriff in den App-Einstellungen.';

  @override
  String get openSettings => 'Einstellungen öffnen';

  @override
  String get openSettingsError => 'Einstellungen konnten nicht geöffnet werden. Bitte manuell öffnen.';

  @override
  String get allowPermission => 'Berechtigung erlauben';
}
