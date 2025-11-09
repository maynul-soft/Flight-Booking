import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CustomFlightIndiCator extends StatelessWidget {
  const CustomFlightIndiCator({super.key, this.child, this.color});

  final Widget? child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              width: 200,
              height: 70,
              child: CustomPaint(
                painter: CustomPaintObject(color ?? Colors.white70),
              ),
            ),
            Positioned(
              left: 82,
              top: 17,
              child: Transform.rotate(
                angle: 1.55,
                child: Icon(
                  Icons.flight,
                  size: 40,
                  color: color ?? Colors.white,
                ),
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                height: 12,
                width: 12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: 2, color: color ?? Colors.white),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                height: 12,
                width: 12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: 2, color: color ?? Colors.white),
                ),
              ),
            ),
          ],
        ),
        child ?? SizedBox.shrink(),
      ],
    );
  }
}

class CustomPaintObject extends CustomPainter {
  CustomPaintObject(this.color);

  Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final gradient = ui.Gradient.linear(
      Offset(0, 0),
      Offset(size.width, 0),
      [
        const Color.fromARGB(0, 255, 255, 255),
        color,
        const Color.fromARGB(0, 255, 255, 255),
      ],
      [0.0, 0.5, 1.0],
    );

    final paint = ui.Paint()
      ..shader = gradient
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(0, size.height);
    path.quadraticBezierTo(size.width / 2, 0, size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
