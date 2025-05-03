// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get yes => 'Да';

  @override
  String get no => 'Нет';

  @override
  String get ok => 'ОК';

  @override
  String get cancel => 'Отмена';

  @override
  String get close => 'Закрыть';

  @override
  String get open => 'Открыть';

  @override
  String get proceed => 'Продолжить';

  @override
  String get share => 'Поделиться';

  @override
  String get reset => 'Reset';

  @override
  String get save => 'Save';

  @override
  String get loading => 'Loading';

  @override
  String get copy => 'Копировать';

  @override
  String get copied => 'Скопировано';

  @override
  String get delete => 'Удалить';

  @override
  String get deleteItem => 'Удалить элемент';

  @override
  String get deleteItemConfirm => 'Вы уверены, что хотите удалить этот элемент?';

  @override
  String get confirm => 'Подтвердить';

  @override
  String get next => 'Далее';

  @override
  String get pickFromGallery => 'Выбрать из галереи';

  @override
  String get system => 'Система';

  @override
  String get light => 'Светлая';

  @override
  String get dark => 'Тёмная';

  @override
  String get low => 'Низкий';

  @override
  String get medium => 'Средний';

  @override
  String get high => 'Высокий';

  @override
  String get app => 'Приложение';

  @override
  String get today => 'Сегодня';

  @override
  String get yesterday => 'Вчера';

  @override
  String itemCount(Object count) {
    return '$count элементов';
  }

  @override
  String get deleteAllItems => 'Удалить все элементы';

  @override
  String get deleteAllItemsWarning => 'Вы уверены, что хотите удалить все элементы?';

  @override
  String get home => 'Главная';

  @override
  String get history => 'История';

  @override
  String get noHistory => 'История пуста';

  @override
  String get settings => 'Настройки';

  @override
  String get scanQRCodeTitle => 'Сканировать QR-код';

  @override
  String get scanQRCodeSubtitle => 'Используйте камеру устройства для сканирования QR-кода.';

  @override
  String get scanImageTitle => 'Сканировать изображение';

  @override
  String get scanImageSubtitle => 'Искать QR-коды в изображении.';

  @override
  String get qrGeneratorTitle => 'Генератор QR';

  @override
  String get qrGeneratorSubtitle => 'Создайте собственный QR-код.';

  @override
  String get text => 'Текст';

  @override
  String get mail => 'Почта';

  @override
  String get to => 'Кому';

  @override
  String get subject => 'Тема';

  @override
  String get body => 'Сообщение';

  @override
  String get url => 'URL';

  @override
  String get urlError => 'Введите действительный URL.';

  @override
  String get phone => 'Телефон';

  @override
  String get message => 'Сообщение';

  @override
  String get sms => 'СМС';

  @override
  String get qrEditor => 'Редактор QR';

  @override
  String get bgColorTitle => 'Цвет фона';

  @override
  String get bgColorSubtitle => 'Выберите контрастный цвет для фона для лучшей читаемости.';

  @override
  String get patternColorTitle => 'Цвет шаблона';

  @override
  String get patternColorSubtitle => 'Выберите цвет для точек QR. Тёмные цвета предпочтительнее.';

  @override
  String get eyeColorTitle => 'Цвет глаз';

  @override
  String get eyeColorSubtitle => 'Выберите цвет углов QR-кода.';

  @override
  String get addLogoTitle => 'Добавить логотип';

  @override
  String get addLogoSubtitle => 'Добавьте свой логотип в центр QR-кода.';

  @override
  String get addLogoWarning => 'Добавление логотипа может затруднить сканирование кода.';

  @override
  String get addLogoInvalidError => 'Выберите допустимый логотип.';

  @override
  String get logoSizeTitle => 'Размер логотипа';

  @override
  String get logoSizeSubtitle => 'Выберите размер логотипа.';

  @override
  String get exportSizeTitle => 'Размер экспорта';

  @override
  String get exportSizeSubtitle => 'Больший размер — лучшее качество.';

  @override
  String get enableGapTitle => 'Включить промежутки';

  @override
  String get enableGapSubtitle => 'Добавить промежутки между точками шаблона.';

  @override
  String get patternShape => 'Форма шаблона';

  @override
  String get eyeShape => 'Форма глаз';

  @override
  String get square => 'Квадрат';

  @override
  String get circle => 'Круг';

  @override
  String get saveQR => 'Сохранить QR';

  @override
  String get shareQR => 'Поделиться QR';

  @override
  String get qrSaved => 'QR сохранён';

  @override
  String get imageNotExists => 'Изображение не существует.';

  @override
  String get imagePickFailed => 'Не удалось выбрать изображение';

  @override
  String get noQRFound => 'QR-код не найден.';

  @override
  String get themeTitle => 'Тема';

  @override
  String get themeSubtitle => 'Режим темы';

  @override
  String get contrastTitle => 'Контраст';

  @override
  String get contrastSubtitle => 'Контрастность темы';

  @override
  String get languageTitle => 'Язык';

  @override
  String get languageSubtitle => 'Выберите предпочитаемый язык';

  @override
  String get data => 'Данные';

  @override
  String get backupDataTitle => 'Резервное копирование';

  @override
  String get backupDataSubtitle => 'Создать резервную копию данных на устройстве.';

  @override
  String get restoreDataTitle => 'Восстановить данные';

  @override
  String get restoreDataSubtitle => 'Восстановить данные из резервной копии.';

  @override
  String get restoreDataWarning => 'Это перезапишет существующие данные. Продолжить?';

  @override
  String get backupSuccess => 'Резервное копирование выполнено';

  @override
  String get backupFailed => 'Ошибка резервного копирования';

  @override
  String get restoreSuccess => 'Восстановление завершено';

  @override
  String get restoreFailed => 'Ошибка восстановления';

  @override
  String get backupInvalidFile => 'Выберите действительный файл резервной копии с расширением .db.';

  @override
  String get deleteDataTitle => 'Удалить данные';

  @override
  String get deleteDataSubtitle => 'Удалить все отсканированные данные.';

  @override
  String get deleteDataWarning => 'Вся история будет удалена без возможности восстановления.';

  @override
  String get about => 'О приложении';

  @override
  String get privacyPolicyTitle => 'Политика конфиденциальности';

  @override
  String get privacyPolicySubtitle => 'Нажмите здесь, чтобы прочитать нашу политику конфиденциальности.';

  @override
  String get licensesTitle => 'Лицензии';

  @override
  String get licensesSubtitle => 'Нажмите здесь, чтобы посмотреть лицензии.';

  @override
  String get reportBugTitle => 'Сообщить об ошибке';

  @override
  String get reportBugSubtitle => 'Сообщить об ошибке на GitHub.';

  @override
  String get reportBugDialogHeading => 'Сообщить об ошибке';

  @override
  String get reportBugDialogTitle => 'Хотите сообщить об ошибке?';

  @override
  String get reportBugDialogSubtitle => 'Откроется страница GitHub Issues для описания ошибки.';

  @override
  String get cameraPermissionRequiredTitle => 'Требуется доступ к камере';

  @override
  String get cameraPermissionRequiredSubtitle => 'Необходимо разрешение для использования камеры для сканирования QR-кодов.';

  @override
  String get cameraPermissionDeniedTitle => 'Доступ к камере навсегда отклонён';

  @override
  String get cameraPermissionDeniedSubtitle => 'Разрешите доступ к камере в настройках приложения.';

  @override
  String get openSettings => 'Открыть настройки';

  @override
  String get openSettingsError => 'Не удалось открыть настройки. Откройте вручную.';

  @override
  String get allowPermission => 'Разрешить доступ';
}
