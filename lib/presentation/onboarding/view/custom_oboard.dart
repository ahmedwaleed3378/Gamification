import 'package:flutter/material.dart';

class OnBoardingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();


    // Path number 1


    paint.color = Color(0xff2B2E35);
    path = Path();
    path.lineTo(0, size.height * 0.18);
    path.cubicTo(0, size.height * 0.12, size.width * 0.04, size.height * 0.08, size.width * 0.09, size.height * 0.07);
    path.cubicTo(size.width * 0.09, size.height * 0.07, size.width * 0.48, 0, size.width * 0.48, 0);
    path.cubicTo(size.width * 0.49, 0, size.width * 0.51, 0, size.width * 0.52, 0);
    path.cubicTo(size.width * 0.52, 0, size.width * 0.91, size.height * 0.07, size.width * 0.91, size.height * 0.07);
    path.cubicTo(size.width * 0.96, size.height * 0.08, size.width, size.height * 0.12, size.width, size.height * 0.18);
    path.cubicTo(size.width, size.height * 0.18, size.width, size.height, size.width, size.height);
    path.cubicTo(size.width, size.height, 0, size.height, 0, size.height);
    path.cubicTo(0, size.height, 0, size.height * 0.18, 0, size.height * 0.18);
    path.cubicTo(0, size.height * 0.18, 0, size.height * 0.18, 0, size.height * 0.18);
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}