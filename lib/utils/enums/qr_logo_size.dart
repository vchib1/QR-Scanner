enum QRLogoSize {
  xs(10.0),
  s(15.0),
  m(20.0),
  l(25.0),
  xl(30.0);

  final double size;

  const QRLogoSize(this.size);

  static QRLogoSize parseValue(double value) {
    return QRLogoSize.values.firstWhere(
      (e) => (e.size == value),
      orElse: () => QRLogoSize.m,
    );
  }
}
