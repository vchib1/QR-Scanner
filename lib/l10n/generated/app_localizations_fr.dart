// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get yes => 'Oui';

  @override
  String get no => 'Non';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Annuler';

  @override
  String get close => 'Fermer';

  @override
  String get open => 'Ouvrir';

  @override
  String get proceed => 'Procéder';

  @override
  String get share => 'Partager';

  @override
  String get reset => 'Reset';

  @override
  String get save => 'Save';

  @override
  String get loading => 'Loading';

  @override
  String get copy => 'Copier';

  @override
  String get copied => 'Copié';

  @override
  String get delete => 'Supprimer';

  @override
  String get deleteItem => 'Supprimer l\'élément';

  @override
  String get deleteItemConfirm => 'Êtes-vous sûr de vouloir supprimer cet élément ?';

  @override
  String get confirm => 'Confirmer';

  @override
  String get next => 'Suivant';

  @override
  String get pickFromGallery => 'Choisir depuis la galerie';

  @override
  String get system => 'Système';

  @override
  String get light => 'Clair';

  @override
  String get dark => 'Sombre';

  @override
  String get low => 'Bas';

  @override
  String get medium => 'Moyenne';

  @override
  String get high => 'Élevé';

  @override
  String get app => 'Application';

  @override
  String get today => 'Aujourd\'hui';

  @override
  String get yesterday => 'Hier';

  @override
  String itemCount(Object count) {
    return '$count éléments';
  }

  @override
  String get deleteAllItems => 'Supprimer tous les éléments';

  @override
  String get deleteAllItemsWarning => 'Êtes-vous sûr de vouloir supprimer tous les éléments ?';

  @override
  String get home => 'Accueil';

  @override
  String get history => 'Historique';

  @override
  String get noHistory => 'Pas d\'historique';

  @override
  String get settings => 'Paramètres';

  @override
  String get scanQRCodeTitle => 'Scanner le code QR';

  @override
  String get scanQRCodeSubtitle => 'Utilisez la caméra de l\'appareil pour scanner un code QR.';

  @override
  String get scanImageTitle => 'Scanner l\'image';

  @override
  String get scanImageSubtitle => 'Rechercher des codes QR dans une image.';

  @override
  String get qrGeneratorTitle => 'Générateur de QR';

  @override
  String get qrGeneratorSubtitle => 'Créez votre propre code QR.';

  @override
  String get text => 'Texte';

  @override
  String get mail => 'Email';

  @override
  String get to => 'À';

  @override
  String get subject => 'Objet';

  @override
  String get body => 'Corps';

  @override
  String get url => 'URL';

  @override
  String get urlError => 'Veuillez entrer une URL valide.';

  @override
  String get phone => 'Téléphone';

  @override
  String get message => 'Message';

  @override
  String get sms => 'SMS';

  @override
  String get qrEditor => 'Éditeur de QR';

  @override
  String get bgColorTitle => 'Couleur de fond';

  @override
  String get bgColorSubtitle => 'Choisissez une couleur qui contraste avec le motif pour assurer un bon scan.';

  @override
  String get patternColorTitle => 'Couleur du motif';

  @override
  String get patternColorSubtitle => 'Choisissez une couleur pour le motif (points). Utilisez une couleur foncée pour un meilleur scan.';

  @override
  String get eyeColorTitle => 'Couleur des yeux';

  @override
  String get eyeColorSubtitle => 'Choisissez une couleur pour le motif des yeux (marqueurs d\'angle).';

  @override
  String get addLogoTitle => 'Ajouter un logo';

  @override
  String get addLogoSubtitle => 'Ajoutez votre logo personnalisé au centre du QR.';

  @override
  String get addLogoWarning => 'L\'ajout d\'un logo peut entraîner des problèmes de lisibilité lors du scan.';

  @override
  String get addLogoInvalidError => 'Veuillez sélectionner un logo valide.';

  @override
  String get logoSizeTitle => 'Taille du logo';

  @override
  String get logoSizeSubtitle => 'Choisissez une taille pour le logo.';

  @override
  String get exportSizeTitle => 'Taille d\'exportation';

  @override
  String get exportSizeSubtitle => 'Une taille plus grande offre une meilleure qualité.';

  @override
  String get enableGapTitle => 'Activer l\'écart';

  @override
  String get enableGapSubtitle => 'Permet d\'avoir un écart entre les points du motif.';

  @override
  String get patternShape => 'Forme du motif';

  @override
  String get eyeShape => 'Forme des yeux';

  @override
  String get square => 'Carré';

  @override
  String get circle => 'Cercle';

  @override
  String get saveQR => 'Enregistrer le QR';

  @override
  String get shareQR => 'Partager le QR';

  @override
  String get qrSaved => 'QR enregistré';

  @override
  String get imageNotExists => 'L\'image n\'existe pas.';

  @override
  String get imagePickFailed => 'Échec de la sélection de l\'image';

  @override
  String get noQRFound => 'Aucun QR trouvé.';

  @override
  String get themeTitle => 'Thème';

  @override
  String get themeSubtitle => 'Mode du thème';

  @override
  String get contrastTitle => 'Contraste';

  @override
  String get contrastSubtitle => 'Contraste du thème';

  @override
  String get languageTitle => 'Langue';

  @override
  String get languageSubtitle => 'Choisissez votre langue préférée';

  @override
  String get data => 'Données';

  @override
  String get backupDataTitle => 'Sauvegarder les données';

  @override
  String get backupDataSubtitle => 'Créez un fichier de sauvegarde sur votre appareil.';

  @override
  String get restoreDataTitle => 'Restaurer les données';

  @override
  String get restoreDataSubtitle => 'Restaurez une sauvegarde depuis votre appareil.';

  @override
  String get restoreDataWarning => 'Ce processus va écraser les données existantes. Êtes-vous sûr de vouloir continuer ?';

  @override
  String get backupSuccess => 'Sauvegarde réussie';

  @override
  String get backupFailed => 'Échec de la sauvegarde';

  @override
  String get restoreSuccess => 'Restauration réussie';

  @override
  String get restoreFailed => 'Échec de la restauration';

  @override
  String get backupInvalidFile => 'Veuillez sélectionner un fichier de sauvegarde valide avec l\'extension .db.';

  @override
  String get deleteDataTitle => 'Supprimer les données';

  @override
  String get deleteDataSubtitle => 'Supprimer toutes les données scannées.';

  @override
  String get deleteDataWarning => 'Tout l\'historique sera supprimé de la base de données. Cette action est irréversible.';

  @override
  String get about => 'À propos';

  @override
  String get privacyPolicyTitle => 'Politique de confidentialité';

  @override
  String get privacyPolicySubtitle => 'Cliquez ici pour lire notre politique de confidentialité.';

  @override
  String get licensesTitle => 'Licences';

  @override
  String get licensesSubtitle => 'Cliquez ici pour voir les licences.';

  @override
  String get reportBugTitle => 'Signaler un bug';

  @override
  String get reportBugSubtitle => 'Signaler un bug sur GitHub.';

  @override
  String get reportBugDialogHeading => 'Signaler un bug';

  @override
  String get reportBugDialogTitle => 'Souhaitez-vous signaler un bug ?';

  @override
  String get reportBugDialogSubtitle => 'Cela ouvrira notre page des problèmes GitHub où vous pourrez décrire le problème rencontré.';

  @override
  String get cameraPermissionRequiredTitle => 'Permission de caméra requise';

  @override
  String get cameraPermissionRequiredSubtitle => 'La permission de la caméra est requise pour scanner les codes QR. Veuillez autoriser l\'accès.';

  @override
  String get cameraPermissionDeniedTitle => 'Permission de caméra définitivement refusée';

  @override
  String get cameraPermissionDeniedSubtitle => 'La permission de la caméra est requise pour scanner les codes QR. Veuillez autoriser l\'accès depuis les paramètres de l\'application.';

  @override
  String get openSettings => 'Ouvrir les paramètres';

  @override
  String get openSettingsError => 'Échec de l\'ouverture des paramètres. Veuillez ouvrir manuellement.';

  @override
  String get allowPermission => 'Autoriser la permission';
}
