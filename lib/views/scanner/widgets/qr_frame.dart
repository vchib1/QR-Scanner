import 'package:flutter/material.dart';

class QRScannerFrame extends StatelessWidget {
  final double size;
  final Color? color;

  const QRScannerFrame({super.key, this.size = 250.0, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: QRScannerFramePainter(borderColor: color ?? Colors.white),
      ),
    );
  }
}

class QRScannerFramePainter extends CustomPainter {
  final Color borderColor;
  final double strokeWidth;
  final double cornerLength;

  QRScannerFramePainter({
    this.borderColor = Colors.white,
    this.strokeWidth = 3.0,
    this.cornerLength = 20.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = borderColor
          ..strokeWidth = strokeWidth
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke;

    final double width = size.width;
    final double height = size.height;

    // Draw corners
    void drawCorner(double x, double y, bool isRight, bool isBottom) {
      final double offsetX = isRight ? -cornerLength : cornerLength;
      final double offsetY = isBottom ? -cornerLength : cornerLength;

      canvas.drawLine(Offset(x, y), Offset(x + offsetX, y), paint);
      canvas.drawLine(Offset(x, y), Offset(x, y + offsetY), paint);
    }

    // Top-left corner
    drawCorner(0, 0, false, false);
    // Top-right corner
    drawCorner(width, 0, true, false);
    // Bottom-left corner
    drawCorner(0, height, false, true);
    // Bottom-right corner
    drawCorner(width, height, true, true);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
