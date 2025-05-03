// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Cancel';

  @override
  String get close => 'Close';

  @override
  String get open => 'Open';

  @override
  String get proceed => 'Proceed';

  @override
  String get share => 'Share';

  @override
  String get reset => 'Reset';

  @override
  String get save => 'Save';

  @override
  String get loading => 'Loading';

  @override
  String get copy => 'Copy';

  @override
  String get copied => 'Copied';

  @override
  String get delete => 'Delete';

  @override
  String get deleteItem => 'Delete Item';

  @override
  String get deleteItemConfirm => 'Are you sure you want to delete this item?';

  @override
  String get confirm => 'Confirm';

  @override
  String get next => 'Next';

  @override
  String get pickFromGallery => 'pick from gallery';

  @override
  String get system => 'System';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';

  @override
  String get low => 'Low';

  @override
  String get medium => 'Medium';

  @override
  String get high => 'High';

  @override
  String get app => 'App';

  @override
  String get today => 'Today';

  @override
  String get yesterday => 'Yesterday';

  @override
  String itemCount(Object count) {
    return '$count items';
  }

  @override
  String get deleteAllItems => 'Delete All Items';

  @override
  String get deleteAllItemsWarning => 'Are you sure you want to delete all items?';

  @override
  String get home => 'Home';

  @override
  String get history => 'History';

  @override
  String get noHistory => 'No History';

  @override
  String get settings => 'Settings';

  @override
  String get scanQRCodeTitle => 'Scan QR Code';

  @override
  String get scanQRCodeSubtitle => 'Scan QR using device camera.';

  @override
  String get scanImageTitle => 'Scan Image';

  @override
  String get scanImageSubtitle => 'Find QR Codes from an image.';

  @override
  String get qrGeneratorTitle => 'QR Generator';

  @override
  String get qrGeneratorSubtitle => 'Create your own QR Code.';

  @override
  String get text => 'Text';

  @override
  String get mail => 'Mail';

  @override
  String get to => 'To';

  @override
  String get subject => 'Subject';

  @override
  String get body => 'Body';

  @override
  String get url => 'Url';

  @override
  String get urlError => 'Please enter a valid URL.';

  @override
  String get phone => 'Phone';

  @override
  String get message => 'Message';

  @override
  String get sms => 'Sms';

  @override
  String get qrEditor => 'QR Editor';

  @override
  String get bgColorTitle => 'Background Color';

  @override
  String get bgColorSubtitle => 'Pick a color that contrasts with the pattern to ensure clear scanning.';

  @override
  String get patternColorTitle => 'Pattern Color';

  @override
  String get patternColorSubtitle => 'Pick color for pattern (dots). Use a dark color for clear scanning.';

  @override
  String get eyeColorTitle => 'Eye Color';

  @override
  String get eyeColorSubtitle => 'Pick a color for the QR eye pattern (corner markers).';

  @override
  String get addLogoTitle => 'Add Logo';

  @override
  String get addLogoSubtitle => 'Add your custom logo in the center of the QR.';

  @override
  String get addLogoWarning => 'Adding a logo could cause readability issues on scan.';

  @override
  String get addLogoInvalidError => 'Please pick a valid logo.';

  @override
  String get logoSizeTitle => 'Logo Size';

  @override
  String get logoSizeSubtitle => 'Pick a size for the logo.';

  @override
  String get exportSizeTitle => 'Export Size';

  @override
  String get exportSizeSubtitle => 'Larger size provides better quality.';

  @override
  String get enableGapTitle => 'Enable Gap';

  @override
  String get enableGapSubtitle => 'Allows the pattern to have some gap between.';

  @override
  String get patternShape => 'Pattern Shape';

  @override
  String get eyeShape => 'Eye Shape';

  @override
  String get square => 'Square';

  @override
  String get circle => 'Circle';

  @override
  String get saveQR => 'Save QR';

  @override
  String get shareQR => 'Share QR';

  @override
  String get qrSaved => 'QR Saved';

  @override
  String get imageNotExists => 'Image does not exist.';

  @override
  String get imagePickFailed => 'Failed to pick image';

  @override
  String get noQRFound => 'No QR Found.';

  @override
  String get themeTitle => 'Theme';

  @override
  String get themeSubtitle => 'Theme Mode';

  @override
  String get contrastTitle => 'Contrast';

  @override
  String get contrastSubtitle => 'Theme Contrast';

  @override
  String get languageTitle => 'Language';

  @override
  String get languageSubtitle => 'Choose your preferred language';

  @override
  String get data => 'Data';

  @override
  String get backupDataTitle => 'Backup Data';

  @override
  String get backupDataSubtitle => 'Create a backup file in your device.';

  @override
  String get restoreDataTitle => 'Restore Data';

  @override
  String get restoreDataSubtitle => 'Restore backup from your device.';

  @override
  String get restoreDataWarning => 'This process will overwrite the existing data. Are you sure you want to proceed?';

  @override
  String get backupSuccess => 'Backup Successful';

  @override
  String get backupFailed => 'Backup Failed';

  @override
  String get restoreSuccess => 'Backup Restore Successful';

  @override
  String get restoreFailed => 'Backup Restore Failed';

  @override
  String get backupInvalidFile => 'Please pick a valid backup file with .db extension.';

  @override
  String get deleteDataTitle => 'Delete Data';

  @override
  String get deleteDataSubtitle => 'Clear scanned items data.';

  @override
  String get deleteDataWarning => 'All history will be permanently removed from the database. This action cannot be undone.';

  @override
  String get about => 'About';

  @override
  String get privacyPolicyTitle => 'Privacy Policy';

  @override
  String get privacyPolicySubtitle => 'Click here to read our privacy policy.';

  @override
  String get licensesTitle => 'Licenses';

  @override
  String get licensesSubtitle => 'Click here to view the licenses.';

  @override
  String get reportBugTitle => 'Bug Report';

  @override
  String get reportBugSubtitle => 'Report a bug on github.';

  @override
  String get reportBugDialogHeading => 'Report a bug';

  @override
  String get reportBugDialogTitle => 'Would you like to report a bug?';

  @override
  String get reportBugDialogSubtitle => 'This will open our GitHub issues page where you can describe the problem you encountered.';

  @override
  String get cameraPermissionRequiredTitle => 'Camera Permission Required';

  @override
  String get cameraPermissionRequiredSubtitle => 'Camera permission is required to scan QR codes. Please allow access.';

  @override
  String get cameraPermissionDeniedTitle => 'Camera Permission Permanently Denied';

  @override
  String get cameraPermissionDeniedSubtitle => 'Camera permission is required to scan QR codes. please allow the permission from the app settings.';

  @override
  String get openSettings => 'Open Settings';

  @override
  String get openSettingsError => 'Failed to open settings. Please open manually.';

  @override
  String get allowPermission => 'Allow Permission';
}
