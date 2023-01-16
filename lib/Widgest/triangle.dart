import 'package:flutter/material.dart';

class DrawTriangleShape extends CustomPainter {
  Paint? painter;
  DrawTriangleShape() {
    painter = Paint()
    // ..color=Colors.blueAccent
      ..color = Colors.purpleAccent
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    path.moveTo(0,size.height / 2);
    path.lineTo(size.width,0);
    path.lineTo(size.height, size.width);
    path.close();
    canvas.drawPath(path, painter!);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
