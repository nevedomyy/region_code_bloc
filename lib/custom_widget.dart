import 'package:flutter/material.dart';
import 'dart:math' as math;


class CustomWidget extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final List<Offset> points = List();
    final w = size.width/2;
    final h = size.height/2;
    final path = Path();
    for(int i=0; i<360; i++){
      points.add(Offset(w+w*math.sin(i*math.pi/180), h+h*math.cos(i*math.pi/180)));
    }
    path.addPolygon(points, true);
    canvas.drawPath(path, Paint()
      ..color = Colors.white54
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}