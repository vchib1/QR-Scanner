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
            painter: QRScannerFramePainter(
              borderColor: color,
              lineColor: Theme.of(context).colorScheme.primary,
              animation: animation,
            ),
          ),
        );
      },
    );
  }
}

class QRScannerFramePainter extends CustomPainter {
  final Animation<double> animation;
  final Color? borderColor;
  final Color? lineColor;
  final double strokeWidth;
  final double cornerLength;

  QRScannerFramePainter({
    required this.animation,
    this.borderColor = Colors.white,
    this.lineColor = Colors.white,
    this.strokeWidth = 3.0,
    this.cornerLength = 20.0,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = borderColor!
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

    // center line
    final dy = lerpDouble(0, height, animation.value) ?? 0.0;
    canvas.drawLine(
      Offset(0, dy),
      Offset(width, dy),
      paint..color = lineColor!,
    );
  }

  @override
  bool shouldRepaint(covariant QRScannerFramePainter oldDelegate) => false;
}
