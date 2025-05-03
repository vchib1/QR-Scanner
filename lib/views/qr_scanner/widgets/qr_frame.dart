import 'dart:ui';
import 'package:flutter/material.dart';

class QRScannerFrame extends StatelessWidget {
  final Animation<double> animation;
  final double size;
  final Color? color;

  const QRScannerFrame({
    super.key,
    this.size = 250.0,
    this.color,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Tween(
        begin: 0.0,
        end: 1.0,
      ).chain(CurveTween(curve: Curves.easeInOut)).animate(animation),
      builder: (context, child) {
        return SizedBox(
          width: size,
          height: size,
          child: CustomPaint(
            painter: QRScannerFramePainter(animation: animation),
          ),
        );
      },
    );
  }
}

class QRScannerFramePainter extends CustomPainter {
  final Animation<double> animation;
  final Color borderColor;
  final Color lineColor;
  final double borderStrokeWidth;
  final double lineStrokeWidth;
  final double cornerLength;

  QRScannerFramePainter({
    required this.animation,
    Color? borderColor = Colors.white,
    Color? lineColor = Colors.white,
    this.borderStrokeWidth = 3.5,
    this.lineStrokeWidth = 3.5,
    this.cornerLength = 50.0,
  }) : borderColor = borderColor!,
       lineColor = lineColor!,
       super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final borderPaint =
        Paint()
          ..color = borderColor
          ..strokeWidth = borderStrokeWidth
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke;

    final linePaint =
        Paint()
          ..color = lineColor
          ..strokeWidth = lineStrokeWidth
          ..style = PaintingStyle.stroke;

    final double width = size.width;
    final double height = size.height;

    // animated center line
    final dy = lerpDouble(0, height, animation.value) ?? 0.0;
    canvas.drawLine(Offset(0, dy), Offset(width, dy), linePaint);

    // Draw corners
    void drawCorner(double x, double y, bool isRight, bool isBottom) {
      final double offsetX = isRight ? -cornerLength : cornerLength;
      final double offsetY = isBottom ? -cornerLength : cornerLength;

      canvas.drawLine(Offset(x, y), Offset(x + offsetX, y), borderPaint);
      canvas.drawLine(Offset(x, y), Offset(x, y + offsetY), borderPaint);
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
  bool shouldRepaint(covariant QRScannerFramePainter oldDelegate) => false;
}
