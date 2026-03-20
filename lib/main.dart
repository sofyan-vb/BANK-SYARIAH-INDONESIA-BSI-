import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async'; 

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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00A39D)), // Toska BSI
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

  // --- FUNGSI BANTUAN UNTUK MEMBUAT DAFTAR MENU DROPDOWN ---
  PopupMenuItem<String> _buildPopupMenuItem(String value, IconData icon, String text, {bool isSelected = false}) {
    return PopupMenuItem<String>(
      value: value,
      height: 45, 
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF00A39D), size: 20),
          const SizedBox(width: 15),
          Text(
            text,
            style: TextStyle(
              color: isSelected ? const Color(0xFF00A39D) : Colors.black87,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  // 1. HEADER & APPBAR (Logo Diperbesar)
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: PopupMenuButton<String>(
        icon: const Icon(Icons.menu, color: Color(0xFF00A39D)), 
        
        offset: const Offset(-15, 45),
        color: Colors.white, 
        surfaceTintColor: Colors.white, 
        elevation: 6, 
        constraints: const BoxConstraints(
          minWidth: 260, 
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(12), 
            bottomLeft: Radius.circular(12)
          )
        ),

        onSelected: (String value) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Menu $value dipilih (Fungsi Replika)')),
          );
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          _buildPopupMenuItem('Beranda', Icons.home_outlined, 'Beranda', isSelected: true),
          _buildPopupMenuItem('Info Rekening', Icons.account_balance_wallet_outlined, 'Info Rekening'),
          _buildPopupMenuItem('Transfer', Icons.swap_horiz_outlined, 'Transfer'),
          _buildPopupMenuItem('Pembayaran', Icons.payments_outlined, 'Pembayaran'),
          _buildPopupMenuItem('Pembelian', Icons.shopping_cart_outlined, 'Pembelian'),
          _buildPopupMenuItem('QRIS', Icons.qr_code_scanner_outlined, 'QRIS'),
          _buildPopupMenuItem('Buka Rekening', Icons.person_add_outlined, 'Buka Rekening'),
          _buildPopupMenuItem('Kotak Masuk', Icons.mail_outline, 'Kotak Masuk'),
          _buildPopupMenuItem('Manajemen Kartu', Icons.credit_card_outlined, 'Manajemen Kartu'),
          _buildPopupMenuItem('Info Kurs', Icons.show_chart, 'Info Kurs dan Emas'),
          _buildPopupMenuItem('Informasi Limit', Icons.insert_chart_outlined, 'Informasi Limit'),
          _buildPopupMenuItem('Keyboard', Icons.keyboard_outlined, 'Keyboard'),
          const PopupMenuDivider(), 
          _buildPopupMenuItem('Aktivasi', Icons.check_box_outlined, 'Aktivasi'),
          _buildPopupMenuItem('Minta Kode', Icons.sync, 'Minta Kode Aktivasi Ulang'),
          _buildPopupMenuItem('Sandi', Icons.lock_outline, 'Pengaturan Kata Sandi'),
          _buildPopupMenuItem('Pin', Icons.edit_outlined, 'Ubah Pin'),
          _buildPopupMenuItem('Bahasa', Icons.g_translate, 'Ubah Bahasa'),
          _buildPopupMenuItem('Email', Icons.email_outlined, 'Email'),
          _buildPopupMenuItem('Tentang', Icons.info_outline, 'Tentang Aplikasi'),
        ],
      ),
      titleSpacing: 0,
      title: Row(
        children: [
          // --- LOGO BSI DENGAN TEKS DIPERBESAR ---
          Stack(
            clipBehavior: Clip.none, 
            children: [
              const Text(
                'BSI',
                style: TextStyle(
                    color: Color(0xFF00A39D),
                    fontWeight: FontWeight.w900, 
                    fontSize: 32), // Ukuran BSI dibesarkan
              ),
              Positioned(
                top: 2,
                right: -10, // Menyesuaikan posisi bintang karena font membesar
                child: const Icon(Icons.star, color: Color(0xFFF8A83A), size: 12), // Bintang sedikit dibesarkan
              ),
            ],
          ),
          
          const SizedBox(width: 10), // Jarak sedikit dilebarkan agar seimbang
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              // Teks BANK SYARIAH INDONESIA dibesarkan menjadi ukuran 12
              Text('BANK SYARIAH', style: TextStyle(color: Color(0xFF00A39D), fontSize: 12, fontWeight: FontWeight.normal, height: 1.0)),
              Text('INDONESIA', style: TextStyle(color: Color(0xFF00A39D), fontSize: 12, fontWeight: FontWeight.normal, height: 1.0)),
            ],
          )
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.mail_outline, color: Color(0xFF00A39D)),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Pesan dibuka')));
          },
        ),
        IconButton(
          icon: const Icon(Icons.qr_code_scanner, color: Color(0xFF00A39D), size: 20),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Scan QR dibuka')));
          },
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.notifications_none, color: Color(0xFF00A39D)),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Notifikasi dibuka')));
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
            hintText: 'Cari promo, fitur baru',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  // 3. NAMA & WAKTU REAL-TIME 
  Widget _buildGreeting() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Align(
        alignment: Alignment.centerRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              "Assalamu'alaikum, SOFYAN IBNU GHAZALI",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(height: 4),
            StreamBuilder(
              stream: Stream.periodic(const Duration(seconds: 1)),
              builder: (context, snapshot) {
                final now = DateTime.now();
                final days = ['Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu'];
                final months = ['Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun', 'Jul', 'Ags', 'Sep', 'Okt', 'Nov', 'Des'];

                final dayName = days[now.weekday % 7];
                final day = now.day;
                final monthName = months[now.month - 1];
                final year = now.year;
                
                final hour = now.hour.toString().padLeft(2, '0');
                final minute = now.minute.toString().padLeft(2, '0');

                return Text(
                  "$dayName, $day $monthName $year • $hour:$minute WIB",
                  style: const TextStyle(
                    color: Color(0xFF00A39D), 
                    fontSize: 12
                  ),
                );
              },
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
              image: NetworkImage('https://i.pinimg.com/736x/70/43/53/7043539b43258b5ae47da7d1b9c0fc50.jpg'), 
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
      {'title': 'Tarik Tunai', 'icon': Icons.cloud_download_outlined}, 
      {'title': 'Buka Rekening', 'icon': Icons.person_add_outlined},
      {'title': 'Top Up eWallet', 'icon': Icons.account_balance_outlined},
      {'title': 'E-Commerce', 'icon': Icons.shopping_bag_outlined},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: menus.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 15,
          crossAxisSpacing: 10,
          childAspectRatio: 0.8, 
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
                            color: Colors.grey.withOpacity(0.15),
                            spreadRadius: 1,
                            blurRadius: 5,
                          )
                        ]
                      ),
                      child: Icon(menus[index]['icon'] as IconData, color: const Color(0xFF00A39D), size: 30), 
                    ),
                    Positioned(
                      bottom: 4,
                      right: 4,
                      child: Container(
                        width: 10,
                        height: 10,
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
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Halaman QRIS akan terbuka')));
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
            content: Text('Halaman $label akan terbuka'),
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