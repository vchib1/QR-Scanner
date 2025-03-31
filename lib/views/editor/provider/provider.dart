import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'state.dart';

final qrEditorProvider =
AutoDisposeNotifierProvider<QREditorProvider, QREditState>(
  QREditorProvider.new,
);

class QREditorProvider extends AutoDisposeNotifier<QREditState> {
  @override
  QREditState build() => const QREditState.init();

  void changeState(QREditState updatedState) => state = updatedState;
}
