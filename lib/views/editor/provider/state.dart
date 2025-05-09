import 'package:ez_qr/utils/enums/qr_logo_size.dart';
import 'package:ez_qr/utils/enums/qr_size.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QREditState {
  final Color bgColor;
  final Color patternColor;
  final Color eyeColor;
  final QrDataModuleShape patternShape;
  final QrEyeShape eyeShape;
  final int version;
  final bool allowGap;
  final Uint8List? selectedLogo;
  final QRLogoSize logoSize;
  final QRSize qrSize;

  const QREditState({
    required this.bgColor,
    required this.patternColor,
    required this.eyeColor,
    required this.patternShape,
    required this.eyeShape,
    required this.version,
    required this.allowGap,
    required this.selectedLogo,
    required this.logoSize,
    required this.qrSize,
  });

  const QREditState.init({
    this.bgColor = Colors.white,
    this.patternColor = Colors.black,
    this.eyeColor = Colors.black,
    this.patternShape = QrDataModuleShape.square,
    this.eyeShape = QrEyeShape.square,
    this.version = QrVersions.min,
    this.allowGap = true,
    this.selectedLogo,
    this.logoSize = QRLogoSize.m,
    this.qrSize = QRSize.l,
  });

  QREditState copyWith({
    Color? bgColor,
    Color? patternColor,
    Color? eyeColor,
    QrDataModuleShape? patternShape,
    QrEyeShape? eyeShape,
    int? version,
    bool? allowGap,
    QRLogoSize? logoSize,
    QRSize? qrSize,
    Uint8List? selectedLogo,
    bool clearLogo = false,
  }) => QREditState(
    bgColor: bgColor ?? this.bgColor,
    patternColor: patternColor ?? this.patternColor,
    eyeColor: eyeColor ?? this.eyeColor,
    patternShape: patternShape ?? this.patternShape,
    eyeShape: eyeShape ?? this.eyeShape,
    version: version ?? this.version,
    allowGap: allowGap ?? this.allowGap,
    logoSize: logoSize ?? this.logoSize,
    qrSize: qrSize ?? this.qrSize,
    selectedLogo: clearLogo ? null : (selectedLogo ?? this.selectedLogo),
  );
}
