import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Wulan tambahkan fitur Drawer (Panel Samping) di sini
      drawer: _buildSideDrawer(),
      appBar: _buildAppBar(context), 
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSearchBar(),
            _buildGreeting(),
            _buildMainBanner(context),
            _buildMiniBanners(context),
            _buildMenuGrid(context),
            const SizedBox(height: 50),
          ],
        ),
      ),
      floatingActionButton: _buildQRISButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  // --- WULAN TAMBAHKAN DESAIN DRAWER (PANEL SAMPING) ---
  Widget _buildSideDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF00A39D)),
            accountName: Text("Sofyan Ibnu Ghazali", style: TextStyle(fontWeight: FontWeight.bold)),
            accountEmail: Text("Mahasiswa Teknik Informatika UIM"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Color(0xFF00A39D), size: 40),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.grey),
            title: const Text('Pengaturan'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.help_outline, color: Colors.grey),
            title: const Text('Pusat Bantuan'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Keluar', style: TextStyle(color: Colors.red)),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  // 1. HEADER & APPBAR (Wulan sudah fungsikan ikonnya secara nyata)
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      // Wulan pakai Builder agar context-nya bisa memanggil Drawer
      leading: Builder(
        builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu, color: Color(0xFF00A39D)),
            onPressed: () {
              // FUNGSI NYATA: Membuka panel samping
              Scaffold.of(context).openDrawer();
            },
          );
        }
      ),
      title: Row(
        children: [
          const Text(
            'BSI',
            style: TextStyle(
                color: Color(0xFF00A39D),
                fontWeight: FontWeight.bold,
                fontSize: 22),
          ),
          const SizedBox(width: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('BANK SYARIAH', style: TextStyle(color: Color(0xFF00A39D), fontSize: 8)),
              Text('INDONESIA', style: TextStyle(color: Color(0xFF00A39D), fontSize: 8)),
            ],
          )
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.mail_outline, color: Color(0xFF00A39D)),
          onPressed: () {
            // FUNGSI NYATA: Membuka Pop-up Pesan
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Kotak Masuk', style: TextStyle(color: Color(0xFF00A39D))),
                content: const Text('Belum ada pesan baru untuk Sofyan hari ini.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Tutup', style: TextStyle(color: Color(0xFF00A39D))),
                  ),
                ],
              ),
            );
          },
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.notifications_none, color: Color(0xFF00A39D)),
              onPressed: () {
                // FUNGSI NYATA: Membuka Pop-up Notifikasi
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Notifikasi', style: TextStyle(color: Color(0xFF00A39D))),
                    content: const Text('Tidak ada pemberitahuan sistem yang baru.'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Tutup', style: TextStyle(color: Color(0xFF00A39D))),
                      ),
                    ],
                  ),
                );
              },
            ),
            Positioned(
              top: 12,
              right: 12,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  // 2. KOLOM PENCARIAN
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(25),
        ),
        child: const TextField(
          decoration: InputDecoration(
            icon: Icon(Icons.search, color: Colors.grey),
            hintText: 'Cari menu, fitur baru',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  // 3. NAMA & LOKASI
  Widget _buildGreeting() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Align(
        alignment: Alignment.centerRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Text(
              "Assalamu'alaikum, SOFYAN IBNU GHAZALI",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            SizedBox(height: 4),
            Text(
              "Pamekasan, Ashr 15:12",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  // 4. BANNER UTAMA 
  Widget _buildMainBanner(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Banner Utama diklik!')));
        },
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              image: AssetImage('asset/hari9.jpg'), 
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
            ),
          ),
          child: const Center(
            child: Text(
              'HARI 9\nTetap Istiqomah',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }

  // 5. BANNER KECIL BAWAH 
  Widget _buildMiniBanners(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('JadiBerkah diklik!')));
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFF00A39D),
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage('asset/berkah.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.volunteer_activism, color: Colors.white, size: 16),
                    SizedBox(width: 5),
                    Text('JadiBerkah.ID', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Warteg Mobile diklik!')));
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green[600],
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage('asset/warteg.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.storefront, color: Colors.white, size: 16),
                    SizedBox(width: 5),
                    Text('Warteg Mobile', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 6. MENU GRID 12 TOMBOL 
  Widget _buildMenuGrid(BuildContext context) {
    final menus = [
      {'title': 'Info Rekening', 'icon': Icons.account_balance_wallet_outlined},
      {'title': 'Transfer', 'icon': Icons.swap_horiz_outlined},
      {'title': 'Bayar', 'icon': Icons.payment_outlined},
      {'title': 'Beli', 'icon': Icons.shopping_cart_outlined},
      {'title': 'Layanan Islami', 'icon': FontAwesomeIcons.moon},
      {'title': 'Berbagi - Ziswaf', 'icon': FontAwesomeIcons.handHoldingHeart},
      {'title': 'e-mas', 'icon': Icons.monetization_on_outlined},
      {'title': 'Favorit', 'icon': Icons.star_border_outlined},
      {'title': 'Tarik Tunai', 'icon': Icons.atm_outlined},
      {'title': 'Buka Rekening', 'icon': Icons.person_add_outlined},
      {'title': 'Top Up eWallet', 'icon': Icons.account_balance_outlined},
      {'title': 'E-Commerce', 'icon': Icons.shopping_bag_outlined},
    ];

    return Padding(
      padding: const EdgeInsets.all(20),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: menus.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: 0.72,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Menu ${menus[index]['title']} diklik!'),
                  duration: const Duration(milliseconds: 800),
                ),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 3,
                          )
                        ]
                      ),
                      child: Icon(menus[index]['icon'] as IconData, color: const Color(0xFF00A39D), size: 28),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF8A83A),
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  menus[index]['title'] as String,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 10, color: Colors.black87, fontWeight: FontWeight.w600),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // 7. TOMBOL QRIS MELINGKAR
  Widget _buildQRISButton(BuildContext context) {
    return SizedBox(
      height: 75,
      width: 75,
      child: FloatingActionButton(
        backgroundColor: const Color(0xFF00A39D),
        elevation: 4,
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('QRIS diklik!')));
        },
        shape: const CircleBorder(
          side: BorderSide(color: Colors.white, width: 3),
        ),
        child: const Text('QRIS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white)),
      ),
    );
  }

  // 8. NAVIGASI BAWAH 
  Widget _buildBottomNav(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xFFF8A83A),
      surfaceTintColor: Colors.transparent,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(context, Icons.home_outlined, 'Beranda'),
            _navItem(context, FontAwesomeIcons.mosque, 'Jadwal Sholat'),
            const SizedBox(width: 40),
            _navItem(context, Icons.chat_outlined, 'Pesan'),
            _navItem(context, Icons.person_outline, 'Profil'),
          ],
        ),
      ),
    );
  }

  Widget _navItem(BuildContext context, IconData icon, String label) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$label diklik!'),
            duration: const Duration(milliseconds: 800),
          ),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 22),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 10)),
        ],
      ),
    );
  }
}