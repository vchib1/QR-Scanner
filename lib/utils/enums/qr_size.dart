enum QrSize {
  xs(100),
  s(150),
  m(200),
  l(250),
  xl(300);

  final double value;

  const QrSize(this.value);

  static QrSize parseValue(double value) {
    return QrSize.values.firstWhere(
      (e) => (e.value == value),
      orElse: () => QrSize.m,
    );
  }
}
