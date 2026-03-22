import 'package:flutter/material.dart';

class DonasiSection extends StatelessWidget {
  const DonasiSection({super.key});

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
                'Program Berbagi (Ziswaf)',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black87),
              ),
              InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Membuka semua program donasi')),
                  );
                },
                child: const Text(
                  'Lihat Semua',
                  style: TextStyle(fontSize: 12, color: Color(0xFF00A39D), fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 130,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildDonasiCard(context, 'Sedekah Jumat', 'Bantu Yatim Dhuafa', 0.8, 'Rp 8.5 Juta'),
                const SizedBox(width: 15),
                
                _buildDonasiCard(context, 'Wakaf Masjid', 'Pembangunan Masjid UIM', 0.3, 'Rp 45 Juta'),
                const SizedBox(width: 15),
                _buildDonasiCard(context, 'Bencana Alam', 'Tanggap Darurat', 0.6, 'Rp 15 Juta'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDonasiCard(BuildContext context, String title, String subtitle, double progress, String terkumpul) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Membuka rincian donasi $title')),
        );
      },
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            )
          ],
          border: Border.all(color: Colors.grey.withOpacity(0.1)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 45,
              decoration: const BoxDecoration(
                color: Color(0xFF00A39D),
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              ),
              child: const Center(
                child: Icon(Icons.volunteer_activism, color: Colors.white, size: 22),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Colors.black87), maxLines: 1, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 2),
                  Text(subtitle, style: const TextStyle(fontSize: 9, color: Colors.grey), maxLines: 1, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey.shade200,
                    color: const Color(0xFFF8A83A), // Warna Oranye khas BSI
                    minHeight: 4,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Terkumpul', style: TextStyle(fontSize: 8, color: Colors.grey)),
                      Text(terkumpul, style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Color(0xFF00A39D))),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}