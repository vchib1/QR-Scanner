// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get yes => '예';

  @override
  String get no => '아니요';

  @override
  String get ok => '확인';

  @override
  String get cancel => '취소';

  @override
  String get close => '닫기';

  @override
  String get open => '열기';

  @override
  String get proceed => '진행';

  @override
  String get share => '공유';

  @override
  String get reset => 'Reset';

  @override
  String get save => 'Save';

  @override
  String get loading => 'Loading';

  @override
  String get copy => '복사';

  @override
  String get copied => '복사됨';

  @override
  String get delete => '삭제';

  @override
  String get deleteItem => '항목 삭제';

  @override
  String get deleteItemConfirm => '이 항목을 삭제하시겠습니까?';

  @override
  String get confirm => '확인';

  @override
  String get next => '다음';

  @override
  String get pickFromGallery => '갤러리에서 선택';

  @override
  String get system => '시스템';

  @override
  String get light => '라이트';

  @override
  String get dark => '다크';

  @override
  String get low => '낮음';

  @override
  String get medium => '중간';

  @override
  String get high => '높음';

  @override
  String get app => '앱';

  @override
  String get today => '오늘';

  @override
  String get yesterday => '어제';

  @override
  String itemCount(Object count) {
    return '$count개 항목';
  }

  @override
  String get deleteAllItems => '모든 항목 삭제';

  @override
  String get deleteAllItemsWarning => '모든 항목을 삭제하시겠습니까?';

  @override
  String get home => '홈';

  @override
  String get history => '기록';

  @override
  String get noHistory => '기록 없음';

  @override
  String get settings => '설정';

  @override
  String get scanQRCodeTitle => 'QR 코드 스캔';

  @override
  String get scanQRCodeSubtitle => '기기 카메라로 QR 코드를 스캔합니다.';

  @override
  String get scanImageTitle => '이미지 스캔';

  @override
  String get scanImageSubtitle => '이미지에서 QR 코드를 인식합니다.';

  @override
  String get qrGeneratorTitle => 'QR 코드 생성기';

  @override
  String get qrGeneratorSubtitle => '나만의 QR 코드를 만드세요.';

  @override
  String get text => '텍스트';

  @override
  String get mail => '메일';

  @override
  String get to => '받는 사람';

  @override
  String get subject => '제목';

  @override
  String get body => '본문';

  @override
  String get url => 'URL';

  @override
  String get urlError => '유효한 URL을 입력하세요.';

  @override
  String get phone => '전화번호';

  @override
  String get message => '메시지';

  @override
  String get sms => 'SMS';

  @override
  String get qrEditor => 'QR 코드 편집기';

  @override
  String get bgColorTitle => '배경 색상';

  @override
  String get bgColorSubtitle => '가독성을 위해 대비가 높은 색상을 선택하세요.';

  @override
  String get patternColorTitle => '패턴 색상';

  @override
  String get patternColorSubtitle => 'QR 코드 점의 색상을 선택하세요. 어두운 색상 권장.';

  @override
  String get eyeColorTitle => '아이 색상';

  @override
  String get eyeColorSubtitle => 'QR 코드의 모서리 부분 색상을 선택하세요.';

  @override
  String get addLogoTitle => '로고 추가';

  @override
  String get addLogoSubtitle => 'QR 코드 중앙에 로고를 추가합니다.';

  @override
  String get addLogoWarning => '로고를 추가하면 인식률이 떨어질 수 있습니다.';

  @override
  String get addLogoInvalidError => '유효한 로고 파일을 선택하세요.';

  @override
  String get logoSizeTitle => '로고 크기';

  @override
  String get logoSizeSubtitle => '로고의 크기를 조정하세요.';

  @override
  String get exportSizeTitle => '내보내기 크기';

  @override
  String get exportSizeSubtitle => '크기가 클수록 더 선명합니다.';

  @override
  String get enableGapTitle => '간격 활성화';

  @override
  String get enableGapSubtitle => 'QR 코드 점 사이에 간격을 추가합니다.';

  @override
  String get patternShape => '패턴 모양';

  @override
  String get eyeShape => '아이 모양';

  @override
  String get square => '사각형';

  @override
  String get circle => '원형';

  @override
  String get saveQR => 'QR 코드 저장';

  @override
  String get shareQR => 'QR 코드 공유';

  @override
  String get qrSaved => 'QR 코드가 저장되었습니다';

  @override
  String get imageNotExists => '이미지가 존재하지 않습니다.';

  @override
  String get imagePickFailed => '이미지를 선택할 수 없습니다.';

  @override
  String get noQRFound => 'QR 코드를 찾을 수 없습니다.';

  @override
  String get themeTitle => '테마';

  @override
  String get themeSubtitle => '테마 모드 설정';

  @override
  String get contrastTitle => '대비';

  @override
  String get contrastSubtitle => '테마 대비 설정';

  @override
  String get languageTitle => '언어';

  @override
  String get languageSubtitle => '선호하는 언어를 선택하세요.';

  @override
  String get data => '데이터';

  @override
  String get backupDataTitle => '데이터 백업';

  @override
  String get backupDataSubtitle => '기기에 데이터를 백업합니다.';

  @override
  String get restoreDataTitle => '데이터 복원';

  @override
  String get restoreDataSubtitle => '백업에서 데이터를 복원합니다.';

  @override
  String get restoreDataWarning => '현재 데이터가 덮어쓰기됩니다. 계속하시겠습니까?';

  @override
  String get backupSuccess => '백업 성공';

  @override
  String get backupFailed => '백업 실패';

  @override
  String get restoreSuccess => '복원 성공';

  @override
  String get restoreFailed => '복원 실패';

  @override
  String get backupInvalidFile => '유효한 .db 백업 파일을 선택하세요.';

  @override
  String get deleteDataTitle => '데이터 삭제';

  @override
  String get deleteDataSubtitle => '모든 기록을 삭제합니다.';

  @override
  String get deleteDataWarning => '모든 기록이 영구적으로 삭제되며 복구할 수 없습니다.';

  @override
  String get about => '정보';

  @override
  String get privacyPolicyTitle => '개인정보 보호정책';

  @override
  String get privacyPolicySubtitle => '개인정보 보호정책을 확인하세요.';

  @override
  String get licensesTitle => '라이선스';

  @override
  String get licensesSubtitle => '사용 중인 라이선스를 확인하세요.';

  @override
  String get reportBugTitle => '버그 신고';

  @override
  String get reportBugSubtitle => 'GitHub에서 버그를 신고합니다.';

  @override
  String get reportBugDialogHeading => '버그 신고';

  @override
  String get reportBugDialogTitle => '버그를 신고하시겠습니까?';

  @override
  String get reportBugDialogSubtitle => 'GitHub의 이슈 페이지가 열립니다. 세부 정보를 입력하세요.';

  @override
  String get cameraPermissionRequiredTitle => '카메라 권한 필요';

  @override
  String get cameraPermissionRequiredSubtitle => 'QR 코드를 스캔하려면 카메라 권한이 필요합니다.';

  @override
  String get cameraPermissionDeniedTitle => '카메라 권한이 영구적으로 거부됨';

  @override
  String get cameraPermissionDeniedSubtitle => '앱 설정에서 카메라 권한을 수동으로 허용하세요.';

  @override
  String get openSettings => '설정 열기';

  @override
  String get openSettingsError => '설정을 열 수 없습니다. 수동으로 열어주세요.';

  @override
  String get allowPermission => '권한 허용';
}
