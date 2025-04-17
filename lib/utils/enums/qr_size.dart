enum QRSize {
  xs(100),
  s(150),
  m(200),
  l(250),
  xl(300);

  final double value;

  const QRSize(this.value);

  static QRSize parseValue(double value) {
    return QRSize.values.firstWhere(
      (e) => (e.value == value),
      orElse: () => QRSize.m,
    );
  }
}
