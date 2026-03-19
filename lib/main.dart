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
      title: 'BSI Mobile UI Replica',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF008D9A)), // Hijau Turkis BSI
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

// Warna Kustom BSI
const Color bsiTeal = Color(0xFF008D9A);
const Color bsiDarkTeal = Color(0xFF00737F);
const Color bsiOrange = Color(0xFFF8A83A);
const Color bsiLightOrange = Color(0xFFFEDAB0);
const Color bsiLightTeal = Color(0xFFE0F2F1);
const Color bsiTextBlack = Color(0xFF333333);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Untuk melacak tab navigasi bawah

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        // Appbar oranye tersembunyi seperti di gambar
        preferredSize: const Size.fromHeight(0.0),
        child: AppBar(
          backgroundColor: bsiOrange, // Bilah navigasi bawah oranye
          elevation: 0,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TopBannerSection(),
            SmallBannersSection(
                onTap: (label) => _handleTap(context, 'Spanduk Kecil $label')), // Fungsionalitas spanduk kecil
            const MenuGridSection(),
            const SizedBox(height: 30), // Padding bawah agar menu tidak tertutup bilah navigasi
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onTap: (index, label) {
          setState(() {
            _selectedIndex = index;
          });
          _handleTap(context, 'Navigasi ke $label');
        },
      ),
      floatingActionButton: FloatingMenuKuButton(
        onTap: () {
          _handleTap(context, 'Membuka MenuKu');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  // Fungsi pembantu untuk menangani ketukan tombol umum
  void _handleTap(BuildContext context, String message) {
    print('Ketuk: $message');
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 1),
    ));
  }
}

// --- BAGIAN 1: SPANDUK ATAS ---
class TopBannerSection extends StatelessWidget {
  const TopBannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Visual Latar Belakang Spanduk (Gradien Turkois & Visual Placeholder)
        Container(
          height: 250,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xFF81D4FA), Colors.white], // Visual turkois dan putih
            ),
          ),
        ),
        // Visual Kota Placeholder (di bagian bawah spanduk)
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 100,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white30, Colors.white10], // Visual kota putih
              ),
            ),
          ),
        ),
        // Visual Tangan & Ponssel Placeholder
        Positioned(
          top: 20,
          right: 20,
          child: FaIcon(FontAwesomeIcons.mobileScreen, color: bsiOrange, size: 100), // Placeholder
        ),
        // Teks Spanduk Utama Verbatim
        Positioned(
          top: 30,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'BSI Mobile',
                style: TextStyle(color: bsiTeal, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                        text: 'Dengan Fitur BI Fast\nTransfer Antar Bank\nHanya ',
                        style: TextStyle(
                            color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold, height: 1.1)),
                     TextSpan(
                        text: 'Rp 2500',
                        style: TextStyle(
                            color: Colors.black, fontSize: 22, fontWeight: FontWeight.w900, height: 1.1)),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Transfer lebih aman, mudah dan murah',
                style: TextStyle(color: Colors.black54, fontSize: 14),
              ),
              const SizedBox(height: 15),
              const Text(
                'www.bankbsi.co.id',
                style: TextStyle(color: Colors.blue, fontSize: 12),
              ),
              const Text(
                'Bank Syariah Indonesia Call 14040',
                style: TextStyle(color: Colors.black54, fontSize: 12),
              ),
            ],
          ),
        ),
        // Titik-titik Pager
        Positioned(
          bottom: 30,
          left: 20,
          child: Row(
            children: List.generate(
                5,
                (index) => Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index == 0 ? bsiOrange : bsiOrange.withOpacity(0.3),
                      ),
                    )),
          ),
        ),
        // Teks Kepatuhan Kecil Verbatim - DIPERBAIKI (Mencegah Overflow)
        Positioned(
          bottom: 10,
          left: 20,
          right: 20, // Tambahkan padding kanan agar teks tidak overflow
          child: const Text(
            'PT Bank Syariah Indonesia Tbk terdaftar dan diawasi oleh Otoritas Jasa Keuangan. dan merupakan Peserta Penjaminan LPS',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.black45, fontSize: 9),
          ),
        ),
      ],
    );
  }
}

// --- BAGIAN 2: SPANDUK KECIL HORIZONTAL ---
class SmallBannersSection extends StatelessWidget {
  final Function(String) onTap;

  const SmallBannersSection({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Row(
        children: [
          _buildSmallBanner(
              context,
              FontAwesomeIcons.donate,
              'JadiBerkah.ID',
              'Ayo berdonasi lebih mudah di JadiBerkah',
              const Color(0xFFF1FDFD),
              bsiTeal,
              bsiTextBlack),
          const SizedBox(width: 10),
          _buildSmallBanner(
              context,
              FontAwesomeIcons.mosque,
              'BSI MASLAHAT Wakaf', // Teks verbatim diperbaiki
              'BSI MASLAHAT Wakaf Pembangunan Masjid Bakauheni',
              const Color(0xFFFEFDF7),
              bsiTeal,
              Colors.black),
        ],
      ),
    );
  }

  // Fungsi pembantu untuk membuat spanduk kecil dengan ketukan
  Widget _buildSmallBanner(BuildContext context, IconData iconData, String title, String subtitle, Color bgColor, Color titleColor, Color subtitleColor) {
    return Expanded(
      child: InkWell(
        onTap: () {
          onTap(title); // Callback fungsionalitas ketukan
        },
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            children: [
              // Visual turkois placeholder di sisi kanan (seperti di gambar)
               Positioned(
                right: 0, top: 0,
                child: FaIcon(iconData, color: bsiOrange, size: 60), // Placeholder
              ),
              Positioned(
                left: 10, top: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(color: titleColor, fontWeight: FontWeight.bold, fontSize: 12)),
                    const SizedBox(height: 2),
                    Text(subtitle, style: TextStyle(color: subtitleColor, fontSize: 10)),
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

// --- BAGIAN 3: MENU GRID (3x4) ---
class MenuGridSection extends StatelessWidget {
  const MenuGridSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Daftar item menu verbatim dengan ikon placeholder representative
    final menuItems = [
      MenuItem('Info Rekening', Icons.account_balance_wallet_outlined),
      MenuItem('Transfer', Icons.swap_calls_outlined),
      MenuItem('Bayar', Icons.payment_outlined),
      MenuItem('Beli', Icons.shopping_cart_outlined),
      MenuItem('Layanan Islami', FontAwesomeIcons.moon), // Placeholder bulan sabit
      MenuItem('Berbagi - Ziswaf', FontAwesomeIcons.handHoldingHeart), // Placeholder
      MenuItem('e-mas', Icons.monetization_on_outlined), // Placeholder koin emas
      MenuItem('Favorit', Icons.star_border_outlined),
      MenuItem('Tarik Tunai', Icons.cloud_download_outlined), // Placeholder cloud
      MenuItem('Buka Rekening', Icons.person_add_alt_1_outlined),
      MenuItem('Top Up eWallet', Icons.phonelink_ring_outlined),
      MenuItem('E-Commerce', Icons.shopping_bag_outlined), // Placeholder
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.8, // DIPERBAIKI (Memberikan lebih banyak ruang vertikal)
        ),
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return InkWell(
            onTap: () {
              _handleMenuTap(context, item.label);
            },
            borderRadius: BorderRadius.circular(8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: bsiLightTeal,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: FaIcon(item.iconData, color: bsiTeal, size: 28),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.label,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.black87, fontSize: 11, fontWeight: FontWeight.w600),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Fungsi pembantu untuk menangani ketukan menu grid
  void _handleMenuTap(BuildContext context, String label) {
    print('Ketuk menu: $label');
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Halaman $label akan terbuka (Fungsi Replika)'),
      duration: const Duration(seconds: 1),
    ));
  }
}

class MenuItem {
  final String label;
  final IconData iconData;
  MenuItem(this.label, this.iconData);
}

// --- BAGIAN 4: TOMBOL MENUKU MENGAMBANG LONJONG ---
class FloatingMenuKuButton extends StatelessWidget {
  final VoidCallback onTap;

  const FloatingMenuKuButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 70), // Sesuaikan agar di atas bilah navigasi oranye
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: bsiTeal,
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(0, 3)),
            ],
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.grid_view_outlined, color: Colors.white, size: 20),
              SizedBox(width: 8),
              Text('MenuKu', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }
}

// --- BAGIAN 5: BILAH NAVIGASI BAWAH KUSTOM (ORANYE) ---
class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int, String) onTap;

  const CustomBottomNavBar({super.key, required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none, // Penting agar tombol QRIS melingkar tidak terpotong
      children: [
        // Bilah Navigasi Oranye BSI
        Container(
          height: 70,
          decoration: const BoxDecoration(
            color: bsiOrange,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(context, FontAwesomeIcons.home, 'Beranda', 0),
              _buildNavItem(context, FontAwesomeIcons.mosque, 'Jadwal Sholat', 1),
              const SizedBox(width: 60), // Ruang kosong untuk tombol QRIS melingkar besar
              _buildNavItem(context, FontAwesomeIcons.calculator, 'Kalkulator', 2),
              _buildNavItem(context, FontAwesomeIcons.handHoldingHeart, 'Care', 3),
            ],
          ),
        ),
        // Tombol QRIS Melingkar Besar
        Positioned(
          bottom: 30, // Posisi mengambang di atas bilah oranye
          child: GestureDetector(
            onTap: () {
              onTap(4, 'QRIS'); // ID kustom untuk QRIS
            },
            child: Container(
              width: 70,
              height: 70,
              decoration: const BoxDecoration(
                color: bsiDarkTeal, // Hijau Tua BSI
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 5)),
                ],
              ),
              child: const Center(
                child: Text(
                  'QRIS',
                  style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Fungsi pembantu untuk membuat item navigasi bawah
  Widget _buildNavItem(BuildContext context, IconData iconData, String label, int index) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        onTap(index, label);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(
            iconData,
            color: isSelected ? bsiTeal : Colors.white70,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(color: isSelected ? bsiTeal : Colors.white70, fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}