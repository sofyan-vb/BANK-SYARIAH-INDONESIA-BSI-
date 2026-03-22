import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LayananIslami extends StatelessWidget {
  const LayananIslami({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Layanan Islami',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black87),
              ),
              InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Membuka semua layanan Islami')),
                  );
                },
                child: const Text(
                  'Lihat Semua',
                  style: TextStyle(fontSize: 12, color: Color(0xFF00A39D), fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildMenuLayanan(context, 'Kiblat', FontAwesomeIcons.compass),
              _buildMenuLayanan(context, 'Zakat', FontAwesomeIcons.handHoldingHeart),
              _buildMenuLayanan(context, 'Juz Amma', FontAwesomeIcons.bookOpen),
              _buildMenuLayanan(context, 'Kajian', FontAwesomeIcons.mosque),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildMenuLayanan(BuildContext context, String title, IconData icon) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Membuka menu $title')),
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: Column(
        children: [
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              color: const Color(0xFFE8F5F5),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                )
              ]
            ),
            child: Icon(icon, color: const Color(0xFF00A39D), size: 24),
          ),
          const SizedBox(height: 8),
          Text(
            title, 
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}