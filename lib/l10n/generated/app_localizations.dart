import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_mr.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_te.dart';
import 'app_localizations_ur.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('bn'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('mr'),
    Locale('pt'),
    Locale('ru'),
    Locale('ta'),
    Locale('te'),
    Locale('ur'),
    Locale('zh')
  ];

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @open.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get open;

  /// No description provided for @proceed.
  ///
  /// In en, this message translates to:
  /// **'Proceed'**
  String get proceed;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @copy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get copy;

  /// No description provided for @copied.
  ///
  /// In en, this message translates to:
  /// **'Copied'**
  String get copied;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @deleteItem.
  ///
  /// In en, this message translates to:
  /// **'Delete Item'**
  String get deleteItem;

  /// No description provided for @deleteItemConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this item?'**
  String get deleteItemConfirm;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @pickFromGallery.
  ///
  /// In en, this message translates to:
  /// **'pick from gallery'**
  String get pickFromGallery;

  /// No description provided for @system.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @low.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get low;

  /// No description provided for @medium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get medium;

  /// No description provided for @high.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get high;

  /// No description provided for @app.
  ///
  /// In en, this message translates to:
  /// **'App'**
  String get app;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// No description provided for @itemCount.
  ///
  /// In en, this message translates to:
  /// **'{count} items'**
  String itemCount(Object count);

  /// No description provided for @deleteAllItems.
  ///
  /// In en, this message translates to:
  /// **'Delete All Items'**
  String get deleteAllItems;

  /// No description provided for @deleteAllItemsWarning.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete all items?'**
  String get deleteAllItemsWarning;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @noHistory.
  ///
  /// In en, this message translates to:
  /// **'No History'**
  String get noHistory;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @scanQRCodeTitle.
  ///
  /// In en, this message translates to:
  /// **'Scan QR Code'**
  String get scanQRCodeTitle;

  /// No description provided for @scanQRCodeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Scan QR using device camera.'**
  String get scanQRCodeSubtitle;

  /// No description provided for @scanImageTitle.
  ///
  /// In en, this message translates to:
  /// **'Scan Image'**
  String get scanImageTitle;

  /// No description provided for @scanImageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Find QR Codes from an image.'**
  String get scanImageSubtitle;

  /// No description provided for @qrGeneratorTitle.
  ///
  /// In en, this message translates to:
  /// **'QR Generator'**
  String get qrGeneratorTitle;

  /// No description provided for @qrGeneratorSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create your own QR Code.'**
  String get qrGeneratorSubtitle;

  /// No description provided for @text.
  ///
  /// In en, this message translates to:
  /// **'Text'**
  String get text;

  /// No description provided for @mail.
  ///
  /// In en, this message translates to:
  /// **'Mail'**
  String get mail;

  /// No description provided for @to.
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get to;

  /// No description provided for @subject.
  ///
  /// In en, this message translates to:
  /// **'Subject'**
  String get subject;

  /// No description provided for @body.
  ///
  /// In en, this message translates to:
  /// **'Body'**
  String get body;

  /// No description provided for @url.
  ///
  /// In en, this message translates to:
  /// **'Url'**
  String get url;

  /// No description provided for @urlError.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid URL.'**
  String get urlError;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @sms.
  ///
  /// In en, this message translates to:
  /// **'Sms'**
  String get sms;

  /// No description provided for @qrEditor.
  ///
  /// In en, this message translates to:
  /// **'QR Editor'**
  String get qrEditor;

  /// No description provided for @bgColorTitle.
  ///
  /// In en, this message translates to:
  /// **'Background Color'**
  String get bgColorTitle;

  /// No description provided for @bgColorSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Pick a color that contrasts with the pattern to ensure clear scanning.'**
  String get bgColorSubtitle;

  /// No description provided for @patternColorTitle.
  ///
  /// In en, this message translates to:
  /// **'Pattern Color'**
  String get patternColorTitle;

  /// No description provided for @patternColorSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Pick color for pattern (dots). Use a dark color for clear scanning.'**
  String get patternColorSubtitle;

  /// No description provided for @eyeColorTitle.
  ///
  /// In en, this message translates to:
  /// **'Eye Color'**
  String get eyeColorTitle;

  /// No description provided for @eyeColorSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Pick a color for the QR eye pattern (corner markers).'**
  String get eyeColorSubtitle;

  /// No description provided for @addLogoTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Logo'**
  String get addLogoTitle;

  /// No description provided for @addLogoSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Add your custom logo in the center of the QR.'**
  String get addLogoSubtitle;

  /// No description provided for @addLogoWarning.
  ///
  /// In en, this message translates to:
  /// **'Adding a logo could cause readability issues on scan.'**
  String get addLogoWarning;

  /// No description provided for @addLogoInvalidError.
  ///
  /// In en, this message translates to:
  /// **'Please pick a valid logo.'**
  String get addLogoInvalidError;

  /// No description provided for @logoSizeTitle.
  ///
  /// In en, this message translates to:
  /// **'Logo Size'**
  String get logoSizeTitle;

  /// No description provided for @logoSizeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Pick a size for the logo.'**
  String get logoSizeSubtitle;

  /// No description provided for @exportSizeTitle.
  ///
  /// In en, this message translates to:
  /// **'Export Size'**
  String get exportSizeTitle;

  /// No description provided for @exportSizeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Larger size provides better quality.'**
  String get exportSizeSubtitle;

  /// No description provided for @enableGapTitle.
  ///
  /// In en, this message translates to:
  /// **'Enable Gap'**
  String get enableGapTitle;

  /// No description provided for @enableGapSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Allows the pattern to have some gap between.'**
  String get enableGapSubtitle;

  /// No description provided for @patternShape.
  ///
  /// In en, this message translates to:
  /// **'Pattern Shape'**
  String get patternShape;

  /// No description provided for @eyeShape.
  ///
  /// In en, this message translates to:
  /// **'Eye Shape'**
  String get eyeShape;

  /// No description provided for @square.
  ///
  /// In en, this message translates to:
  /// **'Square'**
  String get square;

  /// No description provided for @circle.
  ///
  /// In en, this message translates to:
  /// **'Circle'**
  String get circle;

  /// No description provided for @saveQR.
  ///
  /// In en, this message translates to:
  /// **'Save QR'**
  String get saveQR;

  /// No description provided for @shareQR.
  ///
  /// In en, this message translates to:
  /// **'Share QR'**
  String get shareQR;

  /// No description provided for @qrSaved.
  ///
  /// In en, this message translates to:
  /// **'QR Saved'**
  String get qrSaved;

  /// No description provided for @imageNotExists.
  ///
  /// In en, this message translates to:
  /// **'Image does not exist.'**
  String get imageNotExists;

  /// No description provided for @imagePickFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to pick image'**
  String get imagePickFailed;

  /// No description provided for @noQRFound.
  ///
  /// In en, this message translates to:
  /// **'No QR Found.'**
  String get noQRFound;

  /// No description provided for @themeTitle.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get themeTitle;

  /// No description provided for @themeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Theme Mode'**
  String get themeSubtitle;

  /// No description provided for @contrastTitle.
  ///
  /// In en, this message translates to:
  /// **'Contrast'**
  String get contrastTitle;

  /// No description provided for @contrastSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Theme Contrast'**
  String get contrastSubtitle;

  /// No description provided for @languageTitle.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageTitle;

  /// No description provided for @languageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose your preferred language'**
  String get languageSubtitle;

  /// No description provided for @data.
  ///
  /// In en, this message translates to:
  /// **'Data'**
  String get data;

  /// No description provided for @backupDataTitle.
  ///
  /// In en, this message translates to:
  /// **'Backup Data'**
  String get backupDataTitle;

  /// No description provided for @backupDataSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create a backup file in your device.'**
  String get backupDataSubtitle;

  /// No description provided for @restoreDataTitle.
  ///
  /// In en, this message translates to:
  /// **'Restore Data'**
  String get restoreDataTitle;

  /// No description provided for @restoreDataSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Restore backup from your device.'**
  String get restoreDataSubtitle;

  /// No description provided for @restoreDataWarning.
  ///
  /// In en, this message translates to:
  /// **'This process will overwrite the existing data. Are you sure you want to proceed?'**
  String get restoreDataWarning;

  /// No description provided for @backupSuccess.
  ///
  /// In en, this message translates to:
  /// **'Backup Successful'**
  String get backupSuccess;

  /// No description provided for @backupFailed.
  ///
  /// In en, this message translates to:
  /// **'Backup Failed'**
  String get backupFailed;

  /// No description provided for @restoreSuccess.
  ///
  /// In en, this message translates to:
  /// **'Backup Restore Successful'**
  String get restoreSuccess;

  /// No description provided for @restoreFailed.
  ///
  /// In en, this message translates to:
  /// **'Backup Restore Failed'**
  String get restoreFailed;

  /// No description provided for @backupInvalidFile.
  ///
  /// In en, this message translates to:
  /// **'Please pick a valid backup file with .db extension.'**
  String get backupInvalidFile;

  /// No description provided for @deleteDataTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Data'**
  String get deleteDataTitle;

  /// No description provided for @deleteDataSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Clear scanned items data.'**
  String get deleteDataSubtitle;

  /// No description provided for @deleteDataWarning.
  ///
  /// In en, this message translates to:
  /// **'All history will be permanently removed from the database. This action cannot be undone.'**
  String get deleteDataWarning;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @privacyPolicyTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicyTitle;

  /// No description provided for @privacyPolicySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Click here to read our privacy policy.'**
  String get privacyPolicySubtitle;

  /// No description provided for @licensesTitle.
  ///
  /// In en, this message translates to:
  /// **'Licenses'**
  String get licensesTitle;

  /// No description provided for @licensesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Click here to view the licenses.'**
  String get licensesSubtitle;

  /// No description provided for @reportBugTitle.
  ///
  /// In en, this message translates to:
  /// **'Bug Report'**
  String get reportBugTitle;

  /// No description provided for @reportBugSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Report a bug on github.'**
  String get reportBugSubtitle;

  /// No description provided for @reportBugDialogHeading.
  ///
  /// In en, this message translates to:
  /// **'Report a bug'**
  String get reportBugDialogHeading;

  /// No description provided for @reportBugDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Would you like to report a bug?'**
  String get reportBugDialogTitle;

  /// No description provided for @reportBugDialogSubtitle.
  ///
  /// In en, this message translates to:
  /// **'This will open our GitHub issues page where you can describe the problem you encountered.'**
  String get reportBugDialogSubtitle;

  /// No description provided for @cameraPermissionRequiredTitle.
  ///
  /// In en, this message translates to:
  /// **'Camera Permission Required'**
  String get cameraPermissionRequiredTitle;

  /// No description provided for @cameraPermissionRequiredSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Camera permission is required to scan QR codes. Please allow access.'**
  String get cameraPermissionRequiredSubtitle;

  /// No description provided for @cameraPermissionDeniedTitle.
  ///
  /// In en, this message translates to:
  /// **'Camera Permission Permanently Denied'**
  String get cameraPermissionDeniedTitle;

  /// No description provided for @cameraPermissionDeniedSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Camera permission is required to scan QR codes. please allow the permission from the app settings.'**
  String get cameraPermissionDeniedSubtitle;

  /// No description provided for @openSettings.
  ///
  /// In en, this message translates to:
  /// **'Open Settings'**
  String get openSettings;

  /// No description provided for @openSettingsError.
  ///
  /// In en, this message translates to:
  /// **'Failed to open settings. Please open manually.'**
  String get openSettingsError;

  /// No description provided for @allowPermission.
  ///
  /// In en, this message translates to:
  /// **'Allow Permission'**
  String get allowPermission;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'bn', 'de', 'en', 'es', 'fr', 'hi', 'it', 'ja', 'ko', 'mr', 'pt', 'ru', 'ta', 'te', 'ur', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'bn': return AppLocalizationsBn();
    case 'de': return AppLocalizationsDe();
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'fr': return AppLocalizationsFr();
    case 'hi': return AppLocalizationsHi();
    case 'it': return AppLocalizationsIt();
    case 'ja': return AppLocalizationsJa();
    case 'ko': return AppLocalizationsKo();
    case 'mr': return AppLocalizationsMr();
    case 'pt': return AppLocalizationsPt();
    case 'ru': return AppLocalizationsRu();
    case 'ta': return AppLocalizationsTa();
    case 'te': return AppLocalizationsTe();
    case 'ur': return AppLocalizationsUr();
    case 'zh': return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
