import 'package:flutter/material.dart';
import 'dart:ui';

class BalanceCard extends StatefulWidget {
  const BalanceCard({super.key});

  @override
  State<BalanceCard> createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> {
  bool isHidden = true; 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        height: 195, 
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), 
          boxShadow: [BoxShadow(color: const Color(0xFF00A39D).withOpacity(0.2), spreadRadius: 2, blurRadius: 15, offset: const Offset(0, 8))],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [const Color(0xFF00A39D).withOpacity(0.5), const Color(0xFF007570).withOpacity(0.3)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(20), 
                    border: Border.all(color: Colors.white.withOpacity(0.4), width: 1.5),
                  ),
                ),
              ),
              Positioned(right: -40, top: -40, child: CircleAvatar(radius: 80, backgroundColor: Colors.white.withOpacity(0.08))),
              Positioned(right: 60, bottom: -50, child: CircleAvatar(radius: 60, backgroundColor: Colors.white.withOpacity(0.08))),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [Icon(Icons.memory, color: Colors.amberAccent.shade100, size: 30), const SizedBox(width: 8), Transform.rotate(angle: 1.57, child: const Icon(Icons.wifi, color: Colors.white70, size: 24))]),
                        Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5), decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.white.withOpacity(0.5))), child: const Text('Easy Wadiah', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold))),
                      ],
                    ),
                    const Spacer(), 
                    const Text('Total Saldo', style: TextStyle(color: Colors.white70, fontSize: 12)),
                    const SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(isHidden ? 'Rp ••••••••••••' : 'Rp 245.500.000', style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold, letterSpacing: 1.0)),
                        GestureDetector(onTap: () => setState(() => isHidden = !isHidden), child: Icon(isHidden ? Icons.visibility_off : Icons.visibility, color: Colors.white, size: 22)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Text('7123 4567 89', style: TextStyle(color: Colors.white, fontSize: 14, letterSpacing: 2.0, fontWeight: FontWeight.w500)), const SizedBox(width: 15),
                        const Text('Valid\nThru', style: TextStyle(color: Colors.white70, fontSize: 8, height: 1.2)), const SizedBox(width: 4),
                        const Text('12/28', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                        const Spacer(),
                        const Text('GPN', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w900, fontStyle: FontStyle.italic)),
                      ],
                    ),
                    const SizedBox(height: 6),
                    
                    
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2), 
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.person, color: Colors.white, size: 14), 
                        ),
                        const SizedBox(width: 6),
                        const Text('SOFYAN IBNU GHAZALI', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold, letterSpacing: 1.0)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}