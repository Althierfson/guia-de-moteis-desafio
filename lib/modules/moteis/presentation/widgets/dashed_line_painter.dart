import 'package:flutter/material.dart';

class DashedLinePainter extends CustomPainter {
  final Color? color;

  DashedLinePainter({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color ?? Colors.black
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    double dashWidth = 2, dashSpace = 1;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
