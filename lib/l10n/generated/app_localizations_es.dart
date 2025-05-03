// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get yes => 'Sí';

  @override
  String get no => 'No';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Cancelar';

  @override
  String get close => 'Cerrar';

  @override
  String get open => 'Abrir';

  @override
  String get proceed => 'Proceder';

  @override
  String get share => 'Compartir';

  @override
  String get reset => 'Reset';

  @override
  String get save => 'Save';

  @override
  String get loading => 'Loading';

  @override
  String get copy => 'Copiar';

  @override
  String get copied => 'Copiado';

  @override
  String get delete => 'Eliminar';

  @override
  String get deleteItem => 'Eliminar artículo';

  @override
  String get deleteItemConfirm => '¿Estás seguro de que deseas eliminar este artículo?';

  @override
  String get confirm => 'Confirmar';

  @override
  String get next => 'Siguiente';

  @override
  String get pickFromGallery => 'Seleccionar desde la galería';

  @override
  String get system => 'Sistema';

  @override
  String get light => 'Claro';

  @override
  String get dark => 'Oscuro';

  @override
  String get low => 'Bajo';

  @override
  String get medium => 'Medio';

  @override
  String get high => 'Alto';

  @override
  String get app => 'Aplicación';

  @override
  String get today => 'Hoy';

  @override
  String get yesterday => 'Ayer';

  @override
  String itemCount(Object count) {
    return '$count artículos';
  }

  @override
  String get deleteAllItems => 'Eliminar todos los artículos';

  @override
  String get deleteAllItemsWarning => '¿Estás seguro de que deseas eliminar todos los artículos?';

  @override
  String get home => 'Inicio';

  @override
  String get history => 'Historial';

  @override
  String get noHistory => 'No hay historial';

  @override
  String get settings => 'Configuración';

  @override
  String get scanQRCodeTitle => 'Escanear código QR';

  @override
  String get scanQRCodeSubtitle => 'Usa la cámara del dispositivo para escanear un código QR.';

  @override
  String get scanImageTitle => 'Escanear imagen';

  @override
  String get scanImageSubtitle => 'Buscar códigos QR en una imagen.';

  @override
  String get qrGeneratorTitle => 'Generador de QR';

  @override
  String get qrGeneratorSubtitle => 'Crea tu propio código QR.';

  @override
  String get text => 'Texto';

  @override
  String get mail => 'Correo';

  @override
  String get to => 'Para';

  @override
  String get subject => 'Asunto';

  @override
  String get body => 'Cuerpo';

  @override
  String get url => 'URL';

  @override
  String get urlError => 'Por favor, ingresa una URL válida.';

  @override
  String get phone => 'Teléfono';

  @override
  String get message => 'Mensaje';

  @override
  String get sms => 'SMS';

  @override
  String get qrEditor => 'Editor de QR';

  @override
  String get bgColorTitle => 'Color de fondo';

  @override
  String get bgColorSubtitle => 'Elige un color que contraste con el patrón para asegurar un escaneo claro.';

  @override
  String get patternColorTitle => 'Color del patrón';

  @override
  String get patternColorSubtitle => 'Elige un color para el patrón (puntos). Usa un color oscuro para un escaneo claro.';

  @override
  String get eyeColorTitle => 'Color de los ojos';

  @override
  String get eyeColorSubtitle => 'Elige un color para el patrón ocular (marcadores de esquina).';

  @override
  String get addLogoTitle => 'Agregar logo';

  @override
  String get addLogoSubtitle => 'Agrega tu logo personalizado en el centro del QR.';

  @override
  String get addLogoWarning => 'Agregar un logo podría causar problemas de legibilidad al escanear.';

  @override
  String get addLogoInvalidError => 'Por favor, selecciona un logo válido.';

  @override
  String get logoSizeTitle => 'Tamaño del logo';

  @override
  String get logoSizeSubtitle => 'Elige un tamaño para el logo.';

  @override
  String get exportSizeTitle => 'Tamaño de exportación';

  @override
  String get exportSizeSubtitle => 'El tamaño más grande ofrece mejor calidad.';

  @override
  String get enableGapTitle => 'Habilitar espacio';

  @override
  String get enableGapSubtitle => 'Permite que el patrón tenga un espacio entre los puntos.';

  @override
  String get patternShape => 'Forma del patrón';

  @override
  String get eyeShape => 'Forma de los ojos';

  @override
  String get square => 'Cuadrado';

  @override
  String get circle => 'Círculo';

  @override
  String get saveQR => 'Guardar QR';

  @override
  String get shareQR => 'Compartir QR';

  @override
  String get qrSaved => 'QR guardado';

  @override
  String get imageNotExists => 'La imagen no existe.';

  @override
  String get imagePickFailed => 'No se pudo seleccionar la imagen';

  @override
  String get noQRFound => 'No se encontró un QR.';

  @override
  String get themeTitle => 'Tema';

  @override
  String get themeSubtitle => 'Modo de tema';

  @override
  String get contrastTitle => 'Contraste';

  @override
  String get contrastSubtitle => 'Contraste del tema';

  @override
  String get languageTitle => 'Idioma';

  @override
  String get languageSubtitle => 'Elige tu idioma preferido';

  @override
  String get data => 'Datos';

  @override
  String get backupDataTitle => 'Respaldar datos';

  @override
  String get backupDataSubtitle => 'Crea un archivo de respaldo en tu dispositivo.';

  @override
  String get restoreDataTitle => 'Restaurar datos';

  @override
  String get restoreDataSubtitle => 'Restaurar un respaldo desde tu dispositivo.';

  @override
  String get restoreDataWarning => 'Este proceso sobrescribirá los datos existentes. ¿Estás seguro de que deseas continuar?';

  @override
  String get backupSuccess => 'Respaldo exitoso';

  @override
  String get backupFailed => 'Fallo en el respaldo';

  @override
  String get restoreSuccess => 'Restauración exitosa';

  @override
  String get restoreFailed => 'Fallo en la restauración';

  @override
  String get backupInvalidFile => 'Por favor, selecciona un archivo de respaldo válido con extensión .db.';

  @override
  String get deleteDataTitle => 'Eliminar datos';

  @override
  String get deleteDataSubtitle => 'Eliminar todos los datos escaneados.';

  @override
  String get deleteDataWarning => 'Todo el historial se eliminará permanentemente de la base de datos. Esta acción no puede deshacerse.';

  @override
  String get about => 'Acerca de';

  @override
  String get privacyPolicyTitle => 'Política de privacidad';

  @override
  String get privacyPolicySubtitle => 'Haz clic aquí para leer nuestra política de privacidad.';

  @override
  String get licensesTitle => 'Licencias';

  @override
  String get licensesSubtitle => 'Haz clic aquí para ver las licencias.';

  @override
  String get reportBugTitle => 'Reportar un error';

  @override
  String get reportBugSubtitle => 'Reporta un error en GitHub.';

  @override
  String get reportBugDialogHeading => 'Reportar un error';

  @override
  String get reportBugDialogTitle => '¿Te gustaría reportar un error?';

  @override
  String get reportBugDialogSubtitle => 'Esto abrirá nuestra página de problemas en GitHub donde podrás describir el problema que encontraste.';

  @override
  String get cameraPermissionRequiredTitle => 'Permiso de cámara requerido';

  @override
  String get cameraPermissionRequiredSubtitle => 'Se requiere permiso de cámara para escanear códigos QR. Por favor, permite el acceso.';

  @override
  String get cameraPermissionDeniedTitle => 'Permiso de cámara permanentemente denegado';

  @override
  String get cameraPermissionDeniedSubtitle => 'Se requiere permiso de cámara para escanear códigos QR. Por favor, permite el acceso desde la configuración de la app.';

  @override
  String get openSettings => 'Abrir configuración';

  @override
  String get openSettingsError => 'No se pudo abrir la configuración. Por favor, abre manualmente.';

  @override
  String get allowPermission => 'Permitir permiso';
}
