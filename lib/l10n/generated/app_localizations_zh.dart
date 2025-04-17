// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get yes => '是';

  @override
  String get no => '否';

  @override
  String get ok => '确定';

  @override
  String get cancel => '取消';

  @override
  String get close => '关闭';

  @override
  String get open => '打开';

  @override
  String get proceed => '继续';

  @override
  String get share => '分享';

  @override
  String get copy => '复制';

  @override
  String get copied => '已复制';

  @override
  String get delete => '删除';

  @override
  String get deleteItem => '删除项目';

  @override
  String get deleteItemConfirm => '您确定要删除此项目吗？';

  @override
  String get confirm => '确认';

  @override
  String get next => '下一步';

  @override
  String get pickFromGallery => '从图库选择';

  @override
  String get system => '系统';

  @override
  String get light => '浅色';

  @override
  String get dark => '深色';

  @override
  String get low => '低';

  @override
  String get medium => '中';

  @override
  String get high => '高';

  @override
  String get app => '应用';

  @override
  String get today => '今天';

  @override
  String get yesterday => '昨天';

  @override
  String itemCount(Object count) {
    return '$count 项';
  }

  @override
  String get deleteAllItems => '删除所有项目';

  @override
  String get deleteAllItemsWarning => '您确定要删除所有项目吗？';

  @override
  String get home => '首页';

  @override
  String get history => '历史';

  @override
  String get noHistory => '没有历史记录';

  @override
  String get settings => '设置';

  @override
  String get scanQRCodeTitle => '扫描二维码';

  @override
  String get scanQRCodeSubtitle => '使用您的设备摄像头扫描二维码。';

  @override
  String get scanImageTitle => '扫描图片';

  @override
  String get scanImageSubtitle => '从图片中识别二维码。';

  @override
  String get qrGeneratorTitle => '二维码生成器';

  @override
  String get qrGeneratorSubtitle => '创建您自己的二维码。';

  @override
  String get text => '文本';

  @override
  String get mail => '邮件';

  @override
  String get to => '收件人';

  @override
  String get subject => '主题';

  @override
  String get body => '内容';

  @override
  String get url => '网址';

  @override
  String get urlError => '请输入有效的网址。';

  @override
  String get phone => '电话';

  @override
  String get message => '消息';

  @override
  String get sms => '短信';

  @override
  String get qrEditor => '二维码编辑器';

  @override
  String get bgColorTitle => '背景颜色';

  @override
  String get bgColorSubtitle => '选择对比强烈的颜色以增强可读性。';

  @override
  String get patternColorTitle => '图案颜色';

  @override
  String get patternColorSubtitle => '选择二维码点的颜色。深色更容易被识别。';

  @override
  String get eyeColorTitle => '定位点颜色';

  @override
  String get eyeColorSubtitle => '选择二维码角落的颜色。';

  @override
  String get addLogoTitle => '添加标志';

  @override
  String get addLogoSubtitle => '在二维码中心添加您的标志。';

  @override
  String get addLogoWarning => '添加标志可能会降低二维码的可识别性。';

  @override
  String get addLogoInvalidError => '请选择有效的标志文件。';

  @override
  String get logoSizeTitle => '标志大小';

  @override
  String get logoSizeSubtitle => '选择标志的大小。';

  @override
  String get exportSizeTitle => '导出大小';

  @override
  String get exportSizeSubtitle => '尺寸越大，质量越好。';

  @override
  String get enableGapTitle => '启用间隙';

  @override
  String get enableGapSubtitle => '在二维码点之间添加间隙。';

  @override
  String get patternShape => '图案形状';

  @override
  String get eyeShape => '定位点形状';

  @override
  String get square => '方形';

  @override
  String get circle => '圆形';

  @override
  String get saveQR => '保存二维码';

  @override
  String get shareQR => '分享二维码';

  @override
  String get qrSaved => '二维码已保存';

  @override
  String get imageNotExists => '图像不存在。';

  @override
  String get imagePickFailed => '图片选择失败';

  @override
  String get noQRFound => '未检测到二维码。';

  @override
  String get themeTitle => '主题';

  @override
  String get themeSubtitle => '主题模式';

  @override
  String get contrastTitle => '对比度';

  @override
  String get contrastSubtitle => '主题对比度';

  @override
  String get languageTitle => '语言';

  @override
  String get languageSubtitle => '选择您的首选语言';

  @override
  String get data => '数据';

  @override
  String get backupDataTitle => '备份数据';

  @override
  String get backupDataSubtitle => '将数据备份到您的设备。';

  @override
  String get restoreDataTitle => '恢复数据';

  @override
  String get restoreDataSubtitle => '从备份中恢复数据。';

  @override
  String get restoreDataWarning => '这将覆盖现有数据。是否继续？';

  @override
  String get backupSuccess => '备份成功';

  @override
  String get backupFailed => '备份失败';

  @override
  String get restoreSuccess => '恢复成功';

  @override
  String get restoreFailed => '恢复失败';

  @override
  String get backupInvalidFile => '请选择有效的 .db 备份文件。';

  @override
  String get deleteDataTitle => '删除数据';

  @override
  String get deleteDataSubtitle => '删除所有扫描历史记录。';

  @override
  String get deleteDataWarning => '所有历史记录将被永久删除，无法恢复。';

  @override
  String get about => '关于';

  @override
  String get privacyPolicyTitle => '隐私政策';

  @override
  String get privacyPolicySubtitle => '点击查看我们的隐私政策。';

  @override
  String get licensesTitle => '许可证';

  @override
  String get licensesSubtitle => '点击查看使用的许可证。';

  @override
  String get reportBugTitle => '报告错误';

  @override
  String get reportBugSubtitle => '在 GitHub 上报告错误。';

  @override
  String get reportBugDialogHeading => '报告错误';

  @override
  String get reportBugDialogTitle => '是否要报告错误？';

  @override
  String get reportBugDialogSubtitle => '这将打开 GitHub 的问题页面，您可以在此描述错误。';

  @override
  String get cameraPermissionRequiredTitle => '需要相机权限';

  @override
  String get cameraPermissionRequiredSubtitle => '需要授予相机权限才能扫描二维码。';

  @override
  String get cameraPermissionDeniedTitle => '相机权限已被永久拒绝';

  @override
  String get cameraPermissionDeniedSubtitle => '请在应用设置中手动启用相机权限。';

  @override
  String get openSettings => '打开设置';

  @override
  String get openSettingsError => '无法打开设置，请手动操作。';

  @override
  String get allowPermission => '允许权限';
}
