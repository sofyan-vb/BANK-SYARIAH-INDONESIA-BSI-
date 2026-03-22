import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  PopupMenuItem<String> _buildPopupMenuItem(String value, IconData icon, String text, {bool isSelected = false}) {
    return PopupMenuItem<String>(
      value: value,
      height: 45, 
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF00A39D), size: 20),
          const SizedBox(width: 15),
          Text(text, style: TextStyle(color: isSelected ? const Color(0xFF00A39D) : Colors.black87, fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal, fontSize: 13)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: PopupMenuButton<String>(
        icon: const Icon(Icons.menu, color: Color(0xFF00A39D)), 
        offset: const Offset(-15, 45), color: Colors.white, surfaceTintColor: Colors.white, elevation: 6, 
        constraints: const BoxConstraints(minWidth: 260),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(12), bottomLeft: Radius.circular(12))),
        onSelected: (String value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Menu Sidebar: $value dipilih'))),
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
        fit: BoxFit.scaleDown, alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Stack(
              clipBehavior: Clip.none, 
              children: const [
                Text('BSI', style: TextStyle(color: Color(0xFF00A39D), fontWeight: FontWeight.w900, fontSize: 28)),
                Positioned(top: -4, right: -2, child: Icon(Icons.star, color: Color(0xFFF8A83A), size: 10)),
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
          padding: const EdgeInsets.symmetric(horizontal: 4), constraints: const BoxConstraints(),
          icon: const Icon(Icons.mail_outline, color: Color(0xFF00A39D), size: 22),
          onPressed: () {
            showDialog(
              context: context, builder: (context) => AlertDialog(title: const Text('Kotak Masuk', style: TextStyle(color: Color(0xFF00A39D))), content: const Text('Belum ada pesan baru untuk Sofyan hari ini.'), actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Tutup', style: TextStyle(color: Color(0xFF00A39D))))]),
            );
          },
        ),
        IconButton(
          padding: const EdgeInsets.symmetric(horizontal: 4), constraints: const BoxConstraints(),
          icon: const Icon(Icons.qr_code_scanner, color: Color(0xFF00A39D), size: 20),
          onPressed: () {
            showDialog(
              context: context, builder: (context) => AlertDialog(title: const Text('Scan QR', style: TextStyle(color: Color(0xFF00A39D))), content: const Text('Kamera siap memindai kode QR.'), actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Tutup', style: TextStyle(color: Color(0xFF00A39D))))]),
            );
          },
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              padding: const EdgeInsets.symmetric(horizontal: 4), constraints: const BoxConstraints(),
              icon: const Icon(Icons.notifications_none, color: Color(0xFF00A39D), size: 22),
              onPressed: () {
                showDialog(
                  context: context, builder: (context) => AlertDialog(title: const Text('Notifikasi', style: TextStyle(color: Color(0xFF00A39D))), content: const Text('Tidak ada pemberitahuan sistem yang baru.'), actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Tutup', style: TextStyle(color: Color(0xFF00A39D))))]),
                );
              },
            ),
            Positioned(top: 8, right: 8, child: Container(width: 9, height: 9, decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 1.5))))
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
                  title: const Text('Profil Pengguna', style: TextStyle(color: Color(0xFF00A39D), fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                  content: Column(
                    mainAxisSize: MainAxisSize.min, 
                    children: [
                      Container(padding: const EdgeInsets.all(4), decoration: const BoxDecoration(color: Color(0xFF00A39D), shape: BoxShape.circle), child: const CircleAvatar(radius: 45, backgroundColor: Colors.white, backgroundImage: AssetImage('asset/profil.jpg'))),
                      const SizedBox(height: 15),
                      const Text('Sofyan Ibnu Ghazali', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16), textAlign: TextAlign.center),
                      const SizedBox(height: 4),
                      const Text('Mahasiswa Teknik Informatika UIM', style: TextStyle(fontSize: 13, color: Colors.grey), textAlign: TextAlign.center),
                    ],
                  ),
                  actions: [Center(child: TextButton(onPressed: () => Navigator.pop(context), child: const Text('Tutup', style: TextStyle(color: Color(0xFF00A39D), fontWeight: FontWeight.bold))))],
                ),
              );
            },
            child: Container(padding: const EdgeInsets.all(2), decoration: const BoxDecoration(color: Color(0xFF00A39D), shape: BoxShape.circle), child: const CircleAvatar(radius: 14, backgroundColor: Colors.white, backgroundImage: AssetImage('asset/profil.jpg'))),
          ),
        ),
      ],
    );
  }
}