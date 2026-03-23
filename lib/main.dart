import 'package:flutter/material.dart';
import 'splash_screen.dart'; 

void main() {
  runApp(const BSIApp());
}

class BSIApp extends StatelessWidget {
  const BSIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas UTS Sofyan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00A39D)), 
        useMaterial3: true,
      ),
      home: const SplashScreen(), 
    );
  }
}