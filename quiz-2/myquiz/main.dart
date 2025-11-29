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
      home: const Quiz2Page(),
    );
  }
}

class Quiz2Page extends StatelessWidget {
  const Quiz2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // sesuaikan warna appBar / background sesuai Figma
      appBar: AppBar(
        title: const Text('QUIZ 2'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // ganti isi Column ini menyesuaikan layout Figma
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // contoh: header, card, tombol, dll
          ],
        ),
      ),
    );
  }
}