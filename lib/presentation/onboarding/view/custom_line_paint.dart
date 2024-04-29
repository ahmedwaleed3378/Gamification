import 'package:flutter/material.dart';


class CustomLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.5000000,size.height*0.005494505);
    path_0.cubicTo(size.width*0.5000000,size.height*0.02912275,size.width*0.5000000,size.height*0.2735005,size.width*0.5000000,size.height*0.2996462);
    path_0.cubicTo(size.width*0.5000000,size.height*0.3742769,size.width*0.5000000,size.height*0.4489077,size.width*0.5000000,size.height*0.5235385);
    path_0.cubicTo(size.width*0.5000000,size.height*0.6111264,size.width*0.5000000,size.height*0.7042143,size.width*0.5000000,size.height*0.7919780);
    path_0.cubicTo(size.width*0.5000000,size.height*0.8392363,size.width*0.5000000,size.height*0.9462308,size.width*0.5000000,size.height*0.9945055);

    Paint paint_0_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=3.5;
    paint_0_stroke.color=Color(0xff2B2E35).withOpacity(1.0);
    paint_0_stroke.strokeCap = StrokeCap.round;
    paint_0_stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_0,paint_0_stroke );

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_0,paint_0_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}