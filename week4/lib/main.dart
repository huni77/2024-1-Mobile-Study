import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomPaint(
                painter: CustomPaintTest1(),
                size: Size(264, 99.5),
              ),
              SizedBox(height: 30),
              CustomPaint(
                painter: CustomPaintTest2(),
                size: Size(214, 100),
              ),
              SizedBox(height: 30),
              CustomPaint(
                painter: CustomPaintTest3(),
                size: Size(314, 100),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomPaintTest1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint blackPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Paint whitePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Rect blackRect = Rect.fromLTWH(0, 0, 215, 100);
    canvas.drawRect(blackRect, blackPaint);

    Path rightHalfCircle = Path()
      ..moveTo(0, 100)
      ..arcToPoint(
        const Offset(0, 0),
        radius: const Radius.circular(50),
        clockwise: false,
      );
    canvas.drawPath(rightHalfCircle, whitePaint);

    Path leftHalfCircle = Path()
      ..moveTo(214.75, 100)
      ..arcToPoint(
        const Offset(214.75, 0),
        radius: const Radius.circular(50),
        clockwise: false,
      );
    canvas.drawPath(leftHalfCircle, blackPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CustomPaintTest2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint blackPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Paint whitePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Rect blackRect = Rect.fromLTWH(0, 0, 214, 100);
    canvas.drawRect(blackRect, blackPaint);

    Path rightHalfCircle = Path()
      ..moveTo(0, 100)
      ..arcToPoint(
        const Offset(0, 0),
        radius: const Radius.circular(50),
        clockwise: false,
      );
    canvas.drawPath(rightHalfCircle, whitePaint);

    Path leftHalfCircle = Path()
      ..moveTo(214, 100)
      ..arcToPoint(
        const Offset(214, 0),
        radius: const Radius.circular(50),
        clockwise: true,
      );
    canvas.drawPath(leftHalfCircle, whitePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CustomPaintTest3 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint blackPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Paint whitePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path rightHalfCircle = Path()
      ..moveTo(50, 0)
      ..arcToPoint(
        const Offset(50, 100),
        radius: const Radius.circular(50),
        clockwise: false,
      );
    canvas.drawPath(rightHalfCircle, blackPaint);

    Rect blackRect = Rect.fromLTWH(50, 0, 214, 100);
    canvas.drawRect(blackRect, blackPaint);

    Path leftHalfCircle = Path()
      ..moveTo(264, 0)
      ..arcToPoint(
        const Offset(264, 100),
        radius: const Radius.circular(50),
        clockwise: true,
      );
    canvas.drawPath(leftHalfCircle, blackPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
