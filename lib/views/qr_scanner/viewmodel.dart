import 'package:flutter_riverpod/flutter_riverpod.dart';

final qrScannerViewModel =
    AutoDisposeNotifierProvider<QrScannerViewModel, QrScannerState>(
      () => QrScannerViewModel(),
    );

class QrScannerViewModel extends AutoDisposeNotifier<QrScannerState> {
  @override
  QrScannerState build() {
    return QrScannerState();
  }

  void toggleFlash() {
    state = state.copyWith(flashOn: !state.flashOn);
  }

  void setZoom(double zoomLevel) {
    state = state.copyWith(zoomLevel: zoomLevel);
  }

  void setResultFound(bool resultFound) {
    state = state.copyWith(resultFound: resultFound);
  }
}

class QrScannerState {
  final bool flashOn;
  final bool resultFound;
  final double zoomLevel;

  QrScannerState({
    this.flashOn = false,
    this.resultFound = false,
    this.zoomLevel = 0.0,
  });

  QrScannerState copyWith({
    bool? resultFound,
    bool? flashOn,
    double? zoomLevel,
  }) {
    return QrScannerState(
      resultFound: resultFound ?? this.resultFound,
      flashOn: flashOn ?? this.flashOn,
      zoomLevel: zoomLevel ?? this.zoomLevel,
    );
  }
}
