import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas UTS Sofyan',
      home: const MobileBankingHome(),
    );
  }
}

class MobileBankingHome extends StatelessWidget {
  const MobileBankingHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      // Wulan sarankan ubah warna biru ini ke warna khas bank pilihan Sofyan
      appBar: AppBar(
        backgroundColor: Colors.blue[800], 
        title: const Text('Mobile Banking'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- BAGIAN 1: HEADER & SALDO ---
            // Sofyan bisa commit Git pertama kali setelah bagian ini selesai
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue[800],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Selamat Datang,',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Sofyan Ibnu Ghazali',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  
                  // Kotak Saldo Rekening
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Saldo Rekening',
                                  style: TextStyle(fontSize: 14)),
                              SizedBox(height: 5),
                              Text('Rp 10.000.000',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const Icon(Icons.visibility, color: Colors.grey),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // --- BAGIAN 2: MENU UTAMA ---
            // Commit Git lagi ya setelah Sofyan menambahkan bagian ini
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Menu Utama',
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  
                  // GridView untuk menyusun menu-menu m-banking
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: [
                      // Sofyan bisa ganti ikon dan teksnya di bawah ini
                      _buildMenuIcon(Icons.send, 'Transfer'),
                      _buildMenuIcon(Icons.payment, 'Bayar'),
                      _buildMenuIcon(Icons.shopping_cart, 'Top Up'),
                      _buildMenuIcon(Icons.receipt, 'Mutasi'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Wulan pisahkan fungsi pembuatan ikon agar kode Sofyan lebih rapi
  Widget _buildMenuIcon(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.blue[800]),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}