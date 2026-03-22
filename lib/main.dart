import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async'; 
import 'dart:ui'; 

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
      appBar: _buildAppBar(context), 
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSearchBar(),
            _buildGreeting(), 
            
            _buildMainBanner(context),
            _buildSpecialMenuButtons(context),
            
            const SizedBox(height: 15), 
            
            _buildBalanceCard(),

            _buildMenuGrid(context), 
            
            _buildGoldInfoCard(context),
            _buildPromoSection(context),
            
            _buildRecentTransactions(context),
            _buildBranchAtmLocator(context),
            
            // --- INI FITUR BARU PENGGANTI DARI WULAN: CATATAN KEUANGAN ---
            _buildFinancialNotes(context),
            // -------------------------------------------------------------
            
            _buildIslamicInspiration(context),
            _buildHelpCenterNote(),
            _buildSecurityNote(),
            
            const SizedBox(height: 80), 
          ],
        ),
      ),
      floatingActionButton: _buildQRISButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

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
            SnackBar(content: Text('Menu Sidebar: $value dipilih')),
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
      title: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Stack(
              clipBehavior: Clip.none, 
              children: [
                const Text(
                  'BSI', 
                  style: TextStyle(
                      color: Color(0xFF00A39D),
                      fontWeight: FontWeight.w900, 
                      fontSize: 28), 
                ),
                Positioned(
                  top: -4, 
                  right: -2, 
                  child: const Icon(Icons.star, color: Color(0xFFF8A83A), size: 10), 
                ),
              ],
            ),
            
            const SizedBox(width: 8), 
            
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('BANK SYARIAH', style: TextStyle(color: Color(0xFF00A39D), fontSize: 10, fontWeight: FontWeight.bold, height: 1.0)),
                Text('INDONESIA', style: TextStyle(color: Color(0xFF00A39D), fontSize: 10, fontWeight: FontWeight.bold, height: 1.0)),
              ],
            )
          ],
        ),
      ),
      actions: [
        IconButton(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          constraints: const BoxConstraints(),
          icon: const Icon(Icons.mail_outline, color: Color(0xFF00A39D), size: 22),
          onPressed: () {
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
        IconButton(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          constraints: const BoxConstraints(),
          icon: const Icon(Icons.qr_code_scanner, color: Color(0xFF00A39D), size: 20),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Scan QR', style: TextStyle(color: Color(0xFF00A39D))),
                content: const Text('Kamera siap memindai kode QR.'),
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
              padding: const EdgeInsets.symmetric(horizontal: 4),
              constraints: const BoxConstraints(),
              icon: const Icon(Icons.notifications_none, color: Color(0xFF00A39D), size: 22),
              onPressed: () {
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
              top: 0,
              right: 4,
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
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 15.0),
          child: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  title: const Text(
                    'Profil Pengguna', 
                    style: TextStyle(color: Color(0xFF00A39D), fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min, 
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4), 
                        decoration: const BoxDecoration(
                          color: Color(0xFF00A39D), 
                          shape: BoxShape.circle,
                        ),
                        child: const CircleAvatar(
                          radius: 45, 
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage('asset/profil.jpg'), 
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Sofyan Ibnu Ghazali',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Mahasiswa Teknik Informatika UIM',
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  actions: [
                    Center(
                      child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Tutup', style: TextStyle(color: Color(0xFF00A39D), fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(2), 
              decoration: const BoxDecoration(
                color: Color(0xFF00A39D), 
                shape: BoxShape.circle,
              ),
              child: const CircleAvatar(
                radius: 14,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('asset/profil.jpg'), 
              ),
            ),
          ),
        ),
      ],
    );
  }

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

  Widget _buildBalanceCard() {
    bool isHidden = true; 
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: StatefulBuilder(
        builder: (context, setState) {
          return Container(
            height: 195, 
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), 
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF00A39D).withOpacity(0.2), 
                  spreadRadius: 2,
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xFF00A39D).withOpacity(0.5), 
                            const Color(0xFF007570).withOpacity(0.3),
                          ], 
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20), 
                        border: Border.all(
                          color: Colors.white.withOpacity(0.4), 
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                  
                  Positioned(
                    right: -40,
                    top: -40,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.white.withOpacity(0.08),
                    ),
                  ),
                  Positioned(
                    right: 60,
                    bottom: -50,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white.withOpacity(0.08),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.memory, color: Colors.amberAccent.shade100, size: 30),
                                const SizedBox(width: 8),
                                Transform.rotate(
                                  angle: 1.57, 
                                  child: const Icon(Icons.wifi, color: Colors.white70, size: 24),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20), 
                                border: Border.all(color: Colors.white.withOpacity(0.5)),
                              ),
                              child: const Text('Easy Wadiah', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        
                        const Spacer(), 
                        
                        const Text('Total Saldo', style: TextStyle(color: Colors.white70, fontSize: 12)),
                        const SizedBox(height: 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              isHidden ? 'Rp ••••••••••••' : 'Rp 245.500.000',
                              style: const TextStyle(
                                color: Colors.white, 
                                fontSize: 26, 
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isHidden = !isHidden;
                                });
                              },
                              child: Icon(
                                isHidden ? Icons.visibility_off : Icons.visibility,
                                color: Colors.white,
                                size: 22,
                              ),
                            ),
                          ],
                        ),
                        
                        const SizedBox(height: 12),
                        
                        Row(
                          children: [
                            const Text('7123 4567 89', style: TextStyle(color: Colors.white, fontSize: 14, letterSpacing: 2.0, fontWeight: FontWeight.w500)),
                            const SizedBox(width: 15),
                            const Text('Valid\nThru', style: TextStyle(color: Colors.white70, fontSize: 8, height: 1.2)),
                            const SizedBox(width: 4),
                            const Text('12/28', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                            
                            const Spacer(),
                            
                            const Text(
                              'GPN', 
                              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w900, fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          'SOFYAN IBNU GHAZALI', 
                          style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold, letterSpacing: 1.0)
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMainBanner(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Banner HARI 9 diklik!')),
            );
          },
          borderRadius: BorderRadius.circular(15),
          child: Ink(
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
      ),
    );
  }

  Widget _buildSpecialMenuButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Menu JadiBerkah.ID ditekan!')), 
                  );
                },
                borderRadius: BorderRadius.circular(10),
                child: Ink(
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
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Menu Warteg Mobile ditekan!')), 
                  );
                },
                borderRadius: BorderRadius.circular(10),
                child: Ink(
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
          ),
        ],
      ),
    );
  }

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
          return Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Menu ${menus[index]['title']} ditekan!')),
                );
              },
              borderRadius: BorderRadius.circular(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Ink(
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
            ),
          );
        },
      ),
    );
  }

  Widget _buildGoldInfoCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Menu Info Harga Emas (e-mas) dibuka!')),
            );
          },
          borderRadius: BorderRadius.circular(15),
          child: Ink(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
              border: Border.all(color: Colors.grey.withOpacity(0.1)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8F5F5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.monetization_on, color: Color(0xFF00A39D), size: 24),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Info Harga Emas (e-mas)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black87)),
                        SizedBox(height: 4),
                        Text('Harga Beli: Rp 1.150.000 / gram', style: TextStyle(fontSize: 11, color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
                const Icon(Icons.chevron_right, color: Colors.grey),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPromoSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Promo & Informasi',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black87),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 110,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _promoCard(context, 'Promo Buka Rekening', 'Dapatkan Cashback Rp 50.000', Colors.orange[100]!, Icons.wallet_giftcard),
                const SizedBox(width: 15),
                _promoCard(context, 'Diskon QRIS', 'Potongan 20% di Merchant Pilihan', Colors.teal[100]!, Icons.qr_code),
                const SizedBox(width: 15),
                _promoCard(context, 'Kajian Islami', 'Jadwal Kajian Masjid Terdekat', Colors.blue[100]!, FontAwesomeIcons.bookQuran),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _promoCard(BuildContext context, String title, String subtitle, Color color, IconData icon) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Melihat detail $title')),
          );
        },
        borderRadius: BorderRadius.circular(15),
        child: Ink(
          width: 220,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: const Color(0xFF00A39D), size: 28),
              const SizedBox(height: 10),
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black87)),
              const SizedBox(height: 4),
              Text(subtitle, style: const TextStyle(fontSize: 10, color: Colors.black54)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecentTransactions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Mutasi Terakhir',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black87),
              ),
              InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Melihat semua mutasi transaksi')),
                  );
                },
                child: const Text(
                  'Lihat Semua',
                  style: TextStyle(fontSize: 12, color: Color(0xFF00A39D), fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
              border: Border.all(color: Colors.grey.withOpacity(0.1)),
            ),
            child: Column(
              children: [
                _transactionItem(context, Icons.swap_calls, 'Transfer Keluar', '19 Mar 2026', '- Rp 150.000', Colors.red),
                const Divider(height: 1, indent: 15, endIndent: 15, color: Colors.black12),
                _transactionItem(context, Icons.account_balance_wallet, 'Top Up e-Wallet', '18 Mar 2026', '- Rp 50.000', Colors.red),
                const Divider(height: 1, indent: 15, endIndent: 15, color: Colors.black12),
                _transactionItem(context, Icons.arrow_downward, 'Transfer Masuk', '15 Mar 2026', '+ Rp 1.500.000', Colors.green),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _transactionItem(BuildContext context, IconData icon, String title, String date, String amount, Color amountColor) {
    return ListTile(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Detail transaksi: $title')),
        );
      },
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFFE8F5F5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: const Color(0xFF00A39D), size: 20),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black87)),
      subtitle: Text(date, style: const TextStyle(fontSize: 10, color: Colors.grey)),
      trailing: Text(amount, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: amountColor)),
    );
  }

  Widget _buildBranchAtmLocator(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Lokasi Cabang & ATM',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black87),
              ),
              InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Membuka Peta Lokasi')),
                  );
                },
                child: const Text(
                  'Lihat Peta',
                  style: TextStyle(fontSize: 12, color: Color(0xFF00A39D), fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 70,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _locationCard(context, Icons.account_balance, 'KCP Pamekasan', '1.2 km'),
                const SizedBox(width: 15),
                _locationCard(context, Icons.atm, 'ATM BSI UIM', '0.1 km'), 
                const SizedBox(width: 15),
                _locationCard(context, Icons.atm, 'ATM Area Alun-alun', '2.5 km'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _locationCard(BuildContext context, IconData icon, String title, String distance) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Membuka rute ke $title')),
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 165,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
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
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5F5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: const Color(0xFF00A39D), size: 18),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Colors.black87), maxLines: 1, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 4),
                  Text(distance, style: const TextStyle(fontSize: 10, color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- WIDGET BARU PENGGANTI DARI WULAN: CATATAN KEUANGAN ---
  Widget _buildFinancialNotes(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
          border: Border.all(color: Colors.grey.withOpacity(0.1)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Catatan Keuangan Bulan Ini',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black87),
                ),
                InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Membuka detail catatan keuangan')),
                    );
                  },
                  child: const Text(
                    'Detail',
                    style: TextStyle(fontSize: 12, color: Color(0xFF00A39D), fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.arrow_downward, color: Colors.green, size: 14),
                          SizedBox(width: 4),
                          Text('Pemasukan', style: TextStyle(fontSize: 10, color: Colors.grey)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Text('Rp 5.500.000', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black87)),
                    ],
                  ),
                ),
                Container(height: 30, width: 1, color: Colors.grey.withOpacity(0.3)),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.arrow_upward, color: Colors.red, size: 14),
                          SizedBox(width: 4),
                          Text('Pengeluaran', style: TextStyle(fontSize: 10, color: Colors.grey)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Text('Rp 3.250.000', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black87)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: 0.6, 
                backgroundColor: Colors.grey.shade200,
                color: const Color(0xFF00A39D),
                minHeight: 6,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Pengeluaranmu masih dalam batas aman. Pertahankan, Sofyan!',
              style: TextStyle(fontSize: 10, color: Colors.grey, fontStyle: FontStyle.italic),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildIslamicInspiration(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color(0xFFF0F9F9), 
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: const Color(0xFF00A39D).withOpacity(0.3)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(FontAwesomeIcons.quoteLeft, color: Color(0xFF00A39D), size: 20),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Inspirasi Hari Ini',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Color(0xFF00A39D)),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '"Perumpamaan orang yang menginfakkan hartanya di jalan Allah seperti sebutir biji yang menumbuhkan tujuh tangkai..."\n(QS. Al-Baqarah: 261)',
                    style: TextStyle(fontSize: 11, color: Colors.black87, fontStyle: FontStyle.italic, height: 1.3),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHelpCenterNote() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.headset_mic, color: Color(0xFF00A39D), size: 14),
          SizedBox(width: 5),
          Text(
            'Butuh bantuan? Hubungi BSI Call 14040',
            style: TextStyle(fontSize: 10, color: Color(0xFF00A39D), fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildSecurityNote() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.security, color: Colors.grey, size: 14),
          SizedBox(width: 5),
          Expanded(
            child: Text(
              'BSI tidak pernah meminta PIN, Kata Sandi, atau OTP Anda. Jaga selalu kerahasiaan data pribadi Anda.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 9, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQRISButton(BuildContext context) {
    return SizedBox(
      height: 75,
      width: 75,
      child: FloatingActionButton(
        backgroundColor: const Color(0xFF00A39D),
        elevation: 4,
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Membuka Kamera QRIS...')),
          );
        },
        shape: const CircleBorder(
          side: BorderSide(color: Colors.white, width: 3),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.qr_code_scanner, color: Colors.white, size: 28),
            SizedBox(height: 2),
            Text('QRIS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xFFF8A83A),
      surfaceTintColor: Colors.transparent,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: _navItem(context, Icons.home_outlined, 'Beranda')),
            Expanded(child: _navItem(context, FontAwesomeIcons.mosque, 'Jadwal Sholat')),
            const SizedBox(width: 80), 
            Expanded(child: _navItem(context, Icons.chat_outlined, 'Pesan')),
            Expanded(child: _navItem(context, Icons.person_outline, 'Profil')),
          ],
        ),
      ),
    );
  }

  Widget _navItem(BuildContext context, IconData icon, String label) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Halaman $label dibuka!')),
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