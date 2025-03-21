import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';

final qrEditViewModel =
    AutoDisposeNotifierProvider<QREditViewModel, QREditState>(
      QREditViewModel.new,
    );

class QREditViewModel extends AutoDisposeNotifier<QREditState> {
  @override
  QREditState build() {
    return const QREditState(
      bgColor: Colors.white,
      patternColor: Colors.black,
      eyeColor: Colors.black,
      patternShape: QrDataModuleShape.square,
      eyeShape: QrEyeShape.square,
      version: QrVersions.auto,
      allowGap: true,
    );
  }

  void changeState(QREditState updatedState) => state = updatedState;
}

class QREditState {
  final Color bgColor;
  final Color patternColor;
  final Color eyeColor;
  final QrDataModuleShape patternShape;
  final QrEyeShape eyeShape;
  final int version;
  final bool allowGap;

  const QREditState({
    required this.bgColor,
    required this.patternColor,
    required this.eyeColor,
    required this.patternShape,
    required this.eyeShape,
    required this.version,
    required this.allowGap,
  });

  QREditState copyWith({
    Color? bgColor,
    Color? patternColor,
    Color? eyeColor,
    QrDataModuleShape? patternShape,
    QrEyeShape? eyeShape,
    int? version,
    bool? allowGap,
  }) => QREditState(
    bgColor: bgColor ?? this.bgColor,
    patternColor: patternColor ?? this.patternColor,
    eyeColor: eyeColor ?? this.eyeColor,
    patternShape: patternShape ?? this.patternShape,
    eyeShape: eyeShape ?? this.eyeShape,
    version: version ?? this.version,
    allowGap: allowGap ?? this.allowGap,
  );
}
