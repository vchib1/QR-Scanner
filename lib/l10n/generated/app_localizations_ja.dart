// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get yes => 'はい';

  @override
  String get no => 'いいえ';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'キャンセル';

  @override
  String get close => '閉じる';

  @override
  String get open => '開く';

  @override
  String get proceed => '続行';

  @override
  String get share => '共有';

  @override
  String get copy => 'コピー';

  @override
  String get copied => 'コピーしました';

  @override
  String get delete => '削除';

  @override
  String get deleteItem => 'アイテムを削除';

  @override
  String get deleteItemConfirm => 'このアイテムを削除してもよろしいですか？';

  @override
  String get confirm => '確認';

  @override
  String get next => '次へ';

  @override
  String get pickFromGallery => 'ギャラリーから選択';

  @override
  String get system => 'システム';

  @override
  String get light => 'ライト';

  @override
  String get dark => 'ダーク';

  @override
  String get low => '低';

  @override
  String get medium => '中';

  @override
  String get high => '高';

  @override
  String get app => 'アプリ';

  @override
  String get today => '今日';

  @override
  String get yesterday => '昨日';

  @override
  String itemCount(Object count) {
    return '$count 件';
  }

  @override
  String get deleteAllItems => 'すべてのアイテムを削除';

  @override
  String get deleteAllItemsWarning => 'すべてのアイテムを削除してもよろしいですか？';

  @override
  String get home => 'ホーム';

  @override
  String get history => '履歴';

  @override
  String get noHistory => '履歴がありません';

  @override
  String get settings => '設定';

  @override
  String get scanQRCodeTitle => 'QRコードをスキャン';

  @override
  String get scanQRCodeSubtitle => 'デバイスのカメラを使用してQRコードをスキャンします。';

  @override
  String get scanImageTitle => '画像をスキャン';

  @override
  String get scanImageSubtitle => '画像からQRコードを検出します。';

  @override
  String get qrGeneratorTitle => 'QRコード生成器';

  @override
  String get qrGeneratorSubtitle => '自分だけのQRコードを作成します。';

  @override
  String get text => 'テキスト';

  @override
  String get mail => 'メール';

  @override
  String get to => '宛先';

  @override
  String get subject => '件名';

  @override
  String get body => '本文';

  @override
  String get url => 'URL';

  @override
  String get urlError => '有効なURLを入力してください。';

  @override
  String get phone => '電話番号';

  @override
  String get message => 'メッセージ';

  @override
  String get sms => 'SMS';

  @override
  String get qrEditor => 'QRコードエディター';

  @override
  String get bgColorTitle => '背景色';

  @override
  String get bgColorSubtitle => '可読性を高めるにはコントラストの高い色を選択してください。';

  @override
  String get patternColorTitle => 'パターンの色';

  @override
  String get patternColorSubtitle => 'QRコードのドットの色を選択します。濃い色が推奨されます。';

  @override
  String get eyeColorTitle => 'アイの色';

  @override
  String get eyeColorSubtitle => 'QRコードの角の部分の色を選択します。';

  @override
  String get addLogoTitle => 'ロゴを追加';

  @override
  String get addLogoSubtitle => 'QRコードの中央にロゴを追加します。';

  @override
  String get addLogoWarning => 'ロゴを追加すると、QRコードの読み取り精度が下がる場合があります。';

  @override
  String get addLogoInvalidError => '有効なロゴファイルを選択してください。';

  @override
  String get logoSizeTitle => 'ロゴのサイズ';

  @override
  String get logoSizeSubtitle => 'ロゴの大きさを選択します。';

  @override
  String get exportSizeTitle => 'エクスポートサイズ';

  @override
  String get exportSizeSubtitle => '大きいサイズほど高画質になります。';

  @override
  String get enableGapTitle => 'ギャップを有効にする';

  @override
  String get enableGapSubtitle => 'QRコードのドットの間にギャップを追加します。';

  @override
  String get patternShape => 'パターンの形状';

  @override
  String get eyeShape => 'アイの形状';

  @override
  String get square => '四角形';

  @override
  String get circle => '円形';

  @override
  String get saveQR => 'QRコードを保存';

  @override
  String get shareQR => 'QRコードを共有';

  @override
  String get qrSaved => 'QRコードを保存しました';

  @override
  String get imageNotExists => '画像が存在しません。';

  @override
  String get imagePickFailed => '画像の選択に失敗しました';

  @override
  String get noQRFound => 'QRコードが見つかりませんでした。';

  @override
  String get themeTitle => 'テーマ';

  @override
  String get themeSubtitle => 'テーマモードの設定';

  @override
  String get contrastTitle => 'コントラスト';

  @override
  String get contrastSubtitle => 'テーマのコントラスト設定';

  @override
  String get languageTitle => '言語';

  @override
  String get languageSubtitle => '希望の言語を選択してください';

  @override
  String get data => 'データ';

  @override
  String get backupDataTitle => 'データのバックアップ';

  @override
  String get backupDataSubtitle => 'デバイスにデータをバックアップします。';

  @override
  String get restoreDataTitle => 'データの復元';

  @override
  String get restoreDataSubtitle => 'バックアップからデータを復元します。';

  @override
  String get restoreDataWarning => '現在のデータが上書きされます。続行しますか？';

  @override
  String get backupSuccess => 'バックアップに成功しました';

  @override
  String get backupFailed => 'バックアップに失敗しました';

  @override
  String get restoreSuccess => '復元に成功しました';

  @override
  String get restoreFailed => '復元に失敗しました';

  @override
  String get backupInvalidFile => '有効な .db バックアップファイルを選択してください。';

  @override
  String get deleteDataTitle => 'データの削除';

  @override
  String get deleteDataSubtitle => 'すべての履歴を削除します。';

  @override
  String get deleteDataWarning => 'すべての履歴が永久に削除され、元に戻すことはできません。';

  @override
  String get about => 'アバウト';

  @override
  String get privacyPolicyTitle => 'プライバシーポリシー';

  @override
  String get privacyPolicySubtitle => 'プライバシーポリシーをご覧ください。';

  @override
  String get licensesTitle => 'ライセンス';

  @override
  String get licensesSubtitle => '使用中のライセンスをご覧ください。';

  @override
  String get reportBugTitle => 'バグを報告';

  @override
  String get reportBugSubtitle => 'GitHubでバグを報告します。';

  @override
  String get reportBugDialogHeading => 'バグを報告';

  @override
  String get reportBugDialogTitle => 'バグを報告しますか？';

  @override
  String get reportBugDialogSubtitle => 'GitHubのIssueページが開きます。詳細を記入してください。';

  @override
  String get cameraPermissionRequiredTitle => 'カメラの許可が必要です';

  @override
  String get cameraPermissionRequiredSubtitle => 'QRコードをスキャンするにはカメラの許可が必要です。';

  @override
  String get cameraPermissionDeniedTitle => 'カメラの許可が永久に拒否されました';

  @override
  String get cameraPermissionDeniedSubtitle => 'アプリの設定でカメラの許可を手動で有効にしてください。';

  @override
  String get openSettings => '設定を開く';

  @override
  String get openSettingsError => '設定を開けませんでした。手動で開いてください。';

  @override
  String get allowPermission => '許可を与える';
}
