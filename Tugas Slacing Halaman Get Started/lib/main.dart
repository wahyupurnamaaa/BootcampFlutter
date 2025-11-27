import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // News Icon
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: CustomPaint(
                  painter: NewsIconPainter(),
                ),
              ),
              const SizedBox(height: 40),
              // Title Text
              const Text(
                'Yuk, Membaca Bersama\nSanber News',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 12),
              // Subtitle Text
              const Text(
                'Berita Terpercaya Di Ujung Jari Anda',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 40),
              // Masuk Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Navigate to login
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5B9FED),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Masuk',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Mendaftar Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    // TODO: Navigate to register
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF5B9FED),
                    side: const BorderSide(
                      color: Color(0xFF5B9FED),
                      width: 1.5,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Mendaftar',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class NewsIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 3;

    // Background rectangle (newspaper)
    paint.color = const Color(0xFFF5F5F5);
    final bgRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(size.width * 0.25, size.height * 0.15, 
                    size.width * 0.6, size.height * 0.7),
      const Radius.circular(8),
    );
    canvas.drawRRect(bgRect, paint);

    // Border for newspaper
    paint.color = const Color(0xFF333333);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 3;
    canvas.drawRRect(bgRect, paint);

    // Yellow bookmark/ribbon on left
    paint.style = PaintingStyle.fill;
    paint.color = const Color(0xFFE8A647);
    final ribbonRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(size.width * 0.15, size.height * 0.2, 
                    size.width * 0.12, size.height * 0.6),
      const Radius.circular(6),
    );
    canvas.drawRRect(ribbonRect, paint);

    // Border for ribbon
    paint.color = const Color(0xFF333333);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 3;
    canvas.drawRRect(ribbonRect, paint);

    // Inner detail on ribbon
    paint.color = const Color(0xFFD39437);
    paint.style = PaintingStyle.fill;
    final ribbonInner = RRect.fromRectAndRadius(
      Rect.fromLTWH(size.width * 0.17, size.height * 0.25, 
                    size.width * 0.08, size.height * 0.5),
      const Radius.circular(4),
    );
    canvas.drawRRect(ribbonInner, paint);

    paint.style = PaintingStyle.fill;

    // "NEWS" text box
    paint.color = const Color(0xFF333333);
    paint.strokeWidth = 2.5;
    paint.style = PaintingStyle.stroke;
    final newsBox = RRect.fromRectAndRadius(
      Rect.fromLTWH(size.width * 0.32, size.height * 0.22, 
                    size.width * 0.45, size.height * 0.12),
      const Radius.circular(4),
    );
    canvas.drawRRect(newsBox, paint);

    // Red rectangle (image placeholder)
    paint.style = PaintingStyle.fill;
    paint.color = const Color(0xFFE85555);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.34, size.height * 0.38, 
                      size.width * 0.18, size.height * 0.12),
        const Radius.circular(3),
      ),
      paint,
    );

    // Red rectangle border
    paint.style = PaintingStyle.stroke;
    paint.color = const Color(0xFF333333);
    paint.strokeWidth = 2;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.34, size.height * 0.38, 
                      size.width * 0.18, size.height * 0.12),
        const Radius.circular(3),
      ),
      paint,
    );

    // Blue rectangle (image placeholder)
    paint.style = PaintingStyle.fill;
    paint.color = const Color(0xFF5B9FED);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.54, size.height * 0.38, 
                      size.width * 0.18, size.height * 0.12),
        const Radius.circular(3),
      ),
      paint,
    );

    // Blue rectangle border
    paint.style = PaintingStyle.stroke;
    paint.color = const Color(0xFF333333);
    paint.strokeWidth = 2;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.54, size.height * 0.38, 
                      size.width * 0.18, size.height * 0.12),
        const Radius.circular(3),
      ),
      paint,
    );

    // Text lines (simulated)
    paint.strokeWidth = 2;
    paint.strokeCap = StrokeCap.round;

    // First column lines
    for (int i = 0; i < 3; i++) {
      canvas.drawLine(
        Offset(size.width * 0.34, size.height * (0.54 + i * 0.05)),
        Offset(size.width * 0.49, size.height * (0.54 + i * 0.05)),
        paint,
      );
    }

    // Second column lines
    for (int i = 0; i < 3; i++) {
      canvas.drawLine(
        Offset(size.width * 0.54, size.height * (0.54 + i * 0.05)),
        Offset(size.width * 0.69, size.height * (0.54 + i * 0.05)),
        paint,
      );
    }

    // Bottom lines
    for (int i = 0; i < 2; i++) {
      canvas.drawLine(
        Offset(size.width * 0.34, size.height * (0.72 + i * 0.05)),
        Offset(size.width * 0.69, size.height * (0.72 + i * 0.05)),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
