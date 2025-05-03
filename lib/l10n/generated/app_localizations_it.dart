// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get yes => 'Sì';

  @override
  String get no => 'No';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Annulla';

  @override
  String get close => 'Chiudi';

  @override
  String get open => 'Apri';

  @override
  String get proceed => 'Procedi';

  @override
  String get share => 'Condividi';

  @override
  String get reset => 'Reset';

  @override
  String get save => 'Save';

  @override
  String get loading => 'Loading';

  @override
  String get copy => 'Copia';

  @override
  String get copied => 'Copiato';

  @override
  String get delete => 'Elimina';

  @override
  String get deleteItem => 'Elimina elemento';

  @override
  String get deleteItemConfirm => 'Sei sicuro di voler eliminare questo elemento?';

  @override
  String get confirm => 'Conferma';

  @override
  String get next => 'Avanti';

  @override
  String get pickFromGallery => 'Scegli dalla galleria';

  @override
  String get system => 'Sistema';

  @override
  String get light => 'Chiaro';

  @override
  String get dark => 'Scuro';

  @override
  String get low => 'Basso';

  @override
  String get medium => 'Medio';

  @override
  String get high => 'Alto';

  @override
  String get app => 'App';

  @override
  String get today => 'Oggi';

  @override
  String get yesterday => 'Ieri';

  @override
  String itemCount(Object count) {
    return '$count elementi';
  }

  @override
  String get deleteAllItems => 'Elimina tutti gli elementi';

  @override
  String get deleteAllItemsWarning => 'Sei sicuro di voler eliminare tutti gli elementi?';

  @override
  String get home => 'Home';

  @override
  String get history => 'Cronologia';

  @override
  String get noHistory => 'Nessuna cronologia';

  @override
  String get settings => 'Impostazioni';

  @override
  String get scanQRCodeTitle => 'Scansiona QR Code';

  @override
  String get scanQRCodeSubtitle => 'Utilizza la fotocamera del dispositivo per scansionare un codice QR.';

  @override
  String get scanImageTitle => 'Scansiona immagine';

  @override
  String get scanImageSubtitle => 'Cerca codici QR in un\'immagine.';

  @override
  String get qrGeneratorTitle => 'Generatore QR';

  @override
  String get qrGeneratorSubtitle => 'Crea il tuo codice QR.';

  @override
  String get text => 'Testo';

  @override
  String get mail => 'Email';

  @override
  String get to => 'A';

  @override
  String get subject => 'Oggetto';

  @override
  String get body => 'Corpo';

  @override
  String get url => 'URL';

  @override
  String get urlError => 'Inserisci un URL valido.';

  @override
  String get phone => 'Telefono';

  @override
  String get message => 'Messaggio';

  @override
  String get sms => 'SMS';

  @override
  String get qrEditor => 'Editor QR';

  @override
  String get bgColorTitle => 'Colore di sfondo';

  @override
  String get bgColorSubtitle => 'Scegli un colore che contrasta con il motivo per garantire una buona scansione.';

  @override
  String get patternColorTitle => 'Colore del motivo';

  @override
  String get patternColorSubtitle => 'Scegli un colore per il motivo (puntini). Usa un colore scuro per una migliore scansione.';

  @override
  String get eyeColorTitle => 'Colore degli occhi';

  @override
  String get eyeColorSubtitle => 'Scegli un colore per gli occhi (indicatori angolari).';

  @override
  String get addLogoTitle => 'Aggiungi logo';

  @override
  String get addLogoSubtitle => 'Aggiungi il tuo logo personalizzato al centro del QR.';

  @override
  String get addLogoWarning => 'L\'aggiunta di un logo può causare problemi di leggibilità nella scansione.';

  @override
  String get addLogoInvalidError => 'Seleziona un logo valido.';

  @override
  String get logoSizeTitle => 'Dimensione del logo';

  @override
  String get logoSizeSubtitle => 'Scegli una dimensione per il logo.';

  @override
  String get exportSizeTitle => 'Dimensione di esportazione';

  @override
  String get exportSizeSubtitle => 'Una dimensione maggiore garantisce una qualità migliore.';

  @override
  String get enableGapTitle => 'Abilita spaziatura';

  @override
  String get enableGapSubtitle => 'Consente uno spazio tra i puntini del motivo.';

  @override
  String get patternShape => 'Forma del motivo';

  @override
  String get eyeShape => 'Forma degli occhi';

  @override
  String get square => 'Quadrato';

  @override
  String get circle => 'Cerchio';

  @override
  String get saveQR => 'Salva QR';

  @override
  String get shareQR => 'Condividi QR';

  @override
  String get qrSaved => 'QR salvato';

  @override
  String get imageNotExists => 'L\'immagine non esiste.';

  @override
  String get imagePickFailed => 'Selezione immagine fallita';

  @override
  String get noQRFound => 'Nessun QR trovato.';

  @override
  String get themeTitle => 'Tema';

  @override
  String get themeSubtitle => 'Modalità tema';

  @override
  String get contrastTitle => 'Contrasto';

  @override
  String get contrastSubtitle => 'Contrasto del tema';

  @override
  String get languageTitle => 'Lingua';

  @override
  String get languageSubtitle => 'Scegli la tua lingua preferita';

  @override
  String get data => 'Dati';

  @override
  String get backupDataTitle => 'Backup dei dati';

  @override
  String get backupDataSubtitle => 'Crea un file di backup sul tuo dispositivo.';

  @override
  String get restoreDataTitle => 'Ripristina dati';

  @override
  String get restoreDataSubtitle => 'Ripristina un backup dal tuo dispositivo.';

  @override
  String get restoreDataWarning => 'Questo processo sovrascriverà i dati esistenti. Sei sicuro di voler procedere?';

  @override
  String get backupSuccess => 'Backup riuscito';

  @override
  String get backupFailed => 'Backup fallito';

  @override
  String get restoreSuccess => 'Ripristino riuscito';

  @override
  String get restoreFailed => 'Ripristino fallito';

  @override
  String get backupInvalidFile => 'Seleziona un file di backup valido con estensione .db.';

  @override
  String get deleteDataTitle => 'Elimina dati';

  @override
  String get deleteDataSubtitle => 'Elimina tutti i dati scansionati.';

  @override
  String get deleteDataWarning => 'Tutta la cronologia verrà eliminata dal database. Questa azione è irreversibile.';

  @override
  String get about => 'Informazioni';

  @override
  String get privacyPolicyTitle => 'Informativa sulla privacy';

  @override
  String get privacyPolicySubtitle => 'Clicca qui per leggere la nostra informativa sulla privacy.';

  @override
  String get licensesTitle => 'Licenze';

  @override
  String get licensesSubtitle => 'Clicca qui per visualizzare le licenze.';

  @override
  String get reportBugTitle => 'Segnala un bug';

  @override
  String get reportBugSubtitle => 'Segnala un bug su GitHub.';

  @override
  String get reportBugDialogHeading => 'Segnala un bug';

  @override
  String get reportBugDialogTitle => 'Vuoi segnalare un bug?';

  @override
  String get reportBugDialogSubtitle => 'Si aprirà la nostra pagina GitHub Issues dove puoi descrivere il problema riscontrato.';

  @override
  String get cameraPermissionRequiredTitle => 'Permesso fotocamera richiesto';

  @override
  String get cameraPermissionRequiredSubtitle => 'È necessario il permesso della fotocamera per scansionare i codici QR. Consenti l\'accesso.';

  @override
  String get cameraPermissionDeniedTitle => 'Permesso fotocamera negato in modo permanente';

  @override
  String get cameraPermissionDeniedSubtitle => 'È necessario il permesso della fotocamera per scansionare i codici QR. Consenti l\'accesso dalle impostazioni dell\'app.';

  @override
  String get openSettings => 'Apri impostazioni';

  @override
  String get openSettingsError => 'Impossibile aprire le impostazioni. Apri manualmente.';

  @override
  String get allowPermission => 'Consenti permesso';
}
