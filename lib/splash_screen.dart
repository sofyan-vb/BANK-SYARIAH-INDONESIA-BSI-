import 'package:flutter/material.dart';
import 'dart:async';
import 'home_screen.dart'; 

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 10), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: -120,
            right: -100,
            child: Container(
              width: 280,
              height: 280,
              decoration: const BoxDecoration(
                color: Color(0xFFF8A83A), 
                shape: BoxShape.circle,
              ),
            ),
          ),
          

          Positioned(
            bottom: -150,
            left: -150,
            child: Container(
              width: 320,
              height: 320,
              decoration: const BoxDecoration(
                color: Color(0xFF00A39D), 
                shape: BoxShape.circle,
              ),
            ),
          ),

          
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Teks Salam
                const Text(
                  "Assalamu'alaikum\nwarahmatullahi\nwabarakatuh",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF00A39D),
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    height: 1.5, 
                  ),
                ),
                const SizedBox(height: 40),
                
                
                Stack(
                  clipBehavior: Clip.none, 
                  children: const [
                    Text(
                      'BSI', 
                      style: TextStyle(
                        color: Color(0xFF00A39D), 
                        fontWeight: FontWeight.w900, 
                        fontSize: 80, 
                        letterSpacing: -2.0
                      ), 
                    ),
                    Positioned(
                      top: -2, 
                      right: -4, 
                      child: Icon(Icons.star, color: Color(0xFFF8A83A), size: 28), 
                    ),
                  ],
                ),
                
                const SizedBox(height: 60),
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF00A39D)),
                  strokeWidth: 3.5,
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildFooterLogo(Icons.account_balance, 'BANK INDONESIA', Colors.blue.shade800),
                const SizedBox(width: 15),
                _buildFooterLogo(Icons.verified_user, 'OJK', Colors.red.shade800),
                const SizedBox(width: 15),
                _buildFooterLogo(Icons.shield, 'LPS', Colors.orange.shade700),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFooterLogo(IconData icon, String text, Color color) {
    return Row(
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: 4),
        Text(
          text, 
          style: TextStyle(
            fontSize: 9, 
            color: Colors.blueGrey.shade800, 
            fontWeight: FontWeight.bold
          )
        ),
      ],
    );
  }
}