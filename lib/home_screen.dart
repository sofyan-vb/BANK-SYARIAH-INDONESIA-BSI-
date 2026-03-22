import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async'; 

// --- SEMUA FILE WIDGET DIPANGGIL DI SINI YA SAYANG ---
import 'custom_app_bar.dart';
import 'balance_card.dart';
import 'menu_grid.dart';
import 'layanan_islami.dart'; 
import 'donasi_section.dart'; // Wulan tambahkan import Donasi di sini

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(), // Manggil dari custom_app_bar.dart
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSearchBar(),
            _buildGreeting(), 
            
            _buildMainBanner(context),
            _buildSpecialMenuButtons(context),
            
            const SizedBox(height: 15), 
            
            const BalanceCard(), // Manggil dari balance_card.dart

            const MenuGrid(), // Manggil dari menu_grid.dart
            
            // --- NAH, FITUR BARUNYA WULAN PAJANG DI SINI BIAR MUNCUL ---
            const LayananIslami(), 
            // -----------------------------------------------------------

            _buildFavoriteBills(context),
            _buildGoldInfoCard(context),
            _buildPromoSection(context),
            
            _buildRecentTransactions(context),
            _buildBranchAtmLocator(context),
            _buildFinancialNotes(context),
            
            // --- FITUR DONASI JUGA WULAN PAJANG DI SINI ---
            const DonasiSection(),
            // ----------------------------------------------

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

  // --- KOMPONEN LAINNYA TETAP AMAN DI SINI ---
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(25)),
        child: const TextField(
          decoration: InputDecoration(icon: Icon(Icons.search, color: Colors.grey), hintText: 'Cari promo, fitur baru', hintStyle: TextStyle(color: Colors.grey, fontSize: 14), border: InputBorder.none),
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
            const Text("Assalamu'alaikum, SOFYAN IBNU GHAZALI", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 4),
            StreamBuilder(
              stream: Stream.periodic(const Duration(seconds: 1)),
              builder: (context, snapshot) {
                final now = DateTime.now();
                final days = ['Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu'];
                final months = ['Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun', 'Jul', 'Ags', 'Sep', 'Okt', 'Nov', 'Des'];
                return Text("${days[now.weekday % 7]}, ${now.day} ${months[now.month - 1]} ${now.year} • ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')} WIB", style: const TextStyle(color: Color(0xFF00A39D), fontSize: 12));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainBanner(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Banner HARI 9 diklik!'))),
          borderRadius: BorderRadius.circular(15),
          child: Ink(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(image: NetworkImage('https://i.pinimg.com/736x/70/43/53/7043539b43258b5ae47da7d1b9c0fc50.jpg'), fit: BoxFit.cover, colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken)),
            ),
            child: const Center(child: Text('HARI 9\nTetap Istiqomah', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18))),
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
                onTap: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Menu JadiBerkah.ID ditekan!'))),
                borderRadius: BorderRadius.circular(10),
                child: Ink(
                  height: 50,
                  decoration: BoxDecoration(color: const Color(0xFF00A39D), borderRadius: BorderRadius.circular(10), image: const DecorationImage(image: AssetImage('asset/berkah.jpg'), fit: BoxFit.cover, colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken))),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center, children: const [Icon(Icons.volunteer_activism, color: Colors.white, size: 16), SizedBox(width: 5), Text('JadiBerkah.ID', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12))]),
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Menu Warteg Mobile ditekan!'))),
                borderRadius: BorderRadius.circular(10),
                child: Ink(
                  height: 50,
                  decoration: BoxDecoration(color: Colors.green[600], borderRadius: BorderRadius.circular(10), image: const DecorationImage(image: AssetImage('asset/warteg.jpg'), fit: BoxFit.cover, colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken))),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center, children: const [Icon(Icons.storefront, color: Colors.white, size: 16), SizedBox(width: 5), Text('Warteg Mobile', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12))]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoriteBills(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Tagihan & Pembelian', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black87)),
              InkWell(onTap: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Membuka pengaturan tagihan'))), child: const Text('Atur', style: TextStyle(fontSize: 12, color: Color(0xFF00A39D), fontWeight: FontWeight.bold))),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 90,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildBillItem(context, 'PLN', 'Token', Icons.electric_bolt, Colors.amber.shade400), const SizedBox(width: 15),
                _buildBillItem(context, 'Pulsa', 'Telkomsel', Icons.phone_android, Colors.red.shade400), const SizedBox(width: 15),
                _buildBillItem(context, 'PDAM', 'Air', Icons.water_drop, Colors.blue.shade400), const SizedBox(width: 15),
                _buildBillItem(context, 'BPJS', 'Kesehatan', Icons.health_and_safety, Colors.green.shade400), const SizedBox(width: 15),
                _buildBillItem(context, 'Internet', 'Indihome', Icons.wifi, Colors.deepPurple.shade400),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBillItem(BuildContext context, String title, String subtitle, IconData icon, Color color) {
    return InkWell(
      onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Membayar $title $subtitle'))),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 85, padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.15), spreadRadius: 1, blurRadius: 5, offset: const Offset(0, 2))], border: Border.all(color: Colors.grey.withOpacity(0.1))),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(icon, color: color, size: 24), const SizedBox(height: 8), Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Colors.black87)), const SizedBox(height: 2), Text(subtitle, style: const TextStyle(fontSize: 9, color: Colors.grey))]),
      ),
    );
  }

  Widget _buildGoldInfoCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Menu Info Harga Emas (e-mas) dibuka!'))),
          borderRadius: BorderRadius.circular(15),
          child: Ink(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15), boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.15), spreadRadius: 1, blurRadius: 5, offset: const Offset(0, 2))], border: Border.all(color: Colors.grey.withOpacity(0.1))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: const Color(0xFFE8F5F5), borderRadius: BorderRadius.circular(10)), child: const Icon(Icons.monetization_on, color: Color(0xFF00A39D), size: 24)), const SizedBox(width: 15), Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [Text('Info Harga Emas (e-mas)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black87)), SizedBox(height: 4), Text('Harga Beli: Rp 1.150.000 / gram', style: TextStyle(fontSize: 11, color: Colors.grey))])]),
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
          const Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Text('Promo & Informasi', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black87))),
          const SizedBox(height: 10),
          SizedBox(
            height: 110,
            child: ListView(
              scrollDirection: Axis.horizontal, padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _promoCard(context, 'Promo Buka Rekening', 'Dapatkan Cashback Rp 50.000', Colors.orange[100]!, Icons.wallet_giftcard), const SizedBox(width: 15),
                _promoCard(context, 'Diskon QRIS', 'Potongan 20% di Merchant Pilihan', Colors.teal[100]!, Icons.qr_code), const SizedBox(width: 15),
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
        onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Melihat detail $title'))),
        borderRadius: BorderRadius.circular(15),
        child: Ink(width: 220, padding: const EdgeInsets.all(15), decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [Icon(icon, color: const Color(0xFF00A39D), size: 28), const SizedBox(height: 10), Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black87)), const SizedBox(height: 4), Text(subtitle, style: const TextStyle(fontSize: 10, color: Colors.black54))])),
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
              const Text('Mutasi Terakhir', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black87)),
              InkWell(onTap: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Melihat semua mutasi transaksi'))), child: const Text('Lihat Semua', style: TextStyle(fontSize: 12, color: Color(0xFF00A39D), fontWeight: FontWeight.bold))),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15), boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.15), spreadRadius: 1, blurRadius: 5, offset: const Offset(0, 2))], border: Border.all(color: Colors.grey.withOpacity(0.1))),
            child: Column(
              children: [
                _transactionItem(context, Icons.swap_calls, 'Transfer Keluar', '19 Mar 2026', '- Rp 150.000', Colors.red), const Divider(height: 1, indent: 15, endIndent: 15, color: Colors.black12),
                _transactionItem(context, Icons.account_balance_wallet, 'Top Up e-Wallet', '18 Mar 2026', '- Rp 50.000', Colors.red), const Divider(height: 1, indent: 15, endIndent: 15, color: Colors.black12),
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
      onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Detail transaksi: $title'))),
      leading: Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: const Color(0xFFE8F5F5), borderRadius: BorderRadius.circular(8)), child: Icon(icon, color: const Color(0xFF00A39D), size: 20)),
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
              const Text('Lokasi Cabang & ATM', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black87)),
              InkWell(onTap: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Membuka Peta Lokasi'))), child: const Text('Lihat Peta', style: TextStyle(fontSize: 12, color: Color(0xFF00A39D), fontWeight: FontWeight.bold))),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 70,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _locationCard(context, Icons.account_balance, 'KCP Pamekasan', '1.2 km'), const SizedBox(width: 15),
                _locationCard(context, Icons.atm, 'ATM BSI UIM', '0.1 km'), const SizedBox(width: 15),
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
      onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Membuka rute ke $title'))),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 165, padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.15), spreadRadius: 1, blurRadius: 5, offset: const Offset(0, 2))], border: Border.all(color: Colors.grey.withOpacity(0.1))),
        child: Row(
          children: [
            Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: const Color(0xFFE8F5F5), borderRadius: BorderRadius.circular(8)), child: Icon(icon, color: const Color(0xFF00A39D), size: 18)), const SizedBox(width: 10),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Colors.black87), maxLines: 1, overflow: TextOverflow.ellipsis), const SizedBox(height: 4), Text(distance, style: const TextStyle(fontSize: 10, color: Colors.grey))])),
          ],
        ),
      ),
    );
  }

  Widget _buildFinancialNotes(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(15), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15), boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.15), spreadRadius: 1, blurRadius: 5, offset: const Offset(0, 2))], border: Border.all(color: Colors.grey.withOpacity(0.1))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Catatan Keuangan Bulan Ini', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black87)), InkWell(onTap: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Membuka detail catatan keuangan'))), child: const Text('Detail', style: TextStyle(fontSize: 12, color: Color(0xFF00A39D), fontWeight: FontWeight.bold)))]),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(children: const [Icon(Icons.arrow_downward, color: Colors.green, size: 14), SizedBox(width: 4), Text('Pemasukan', style: TextStyle(fontSize: 10, color: Colors.grey))]), const SizedBox(height: 4), const Text('Rp 5.500.000', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black87))])),
                Container(height: 30, width: 1, color: Colors.grey.withOpacity(0.3)), const SizedBox(width: 15),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(children: const [Icon(Icons.arrow_upward, color: Colors.red, size: 14), SizedBox(width: 4), Text('Pengeluaran', style: TextStyle(fontSize: 10, color: Colors.grey))]), const SizedBox(height: 4), const Text('Rp 3.250.000', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black87))])),
              ],
            ),
            const SizedBox(height: 15),
            ClipRRect(borderRadius: BorderRadius.circular(10), child: LinearProgressIndicator(value: 0.6, backgroundColor: Colors.grey.shade200, color: const Color(0xFF00A39D), minHeight: 6)), const SizedBox(height: 8),
            const Text('Pengeluaranmu masih dalam batas aman. Pertahankan, Sofyan!', style: TextStyle(fontSize: 10, color: Colors.grey, fontStyle: FontStyle.italic))
          ],
        ),
      ),
    );
  }

  Widget _buildIslamicInspiration(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(15), decoration: BoxDecoration(color: const Color(0xFFF0F9F9), borderRadius: BorderRadius.circular(15), border: Border.all(color: const Color(0xFF00A39D).withOpacity(0.3))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(FontAwesomeIcons.quoteLeft, color: Color(0xFF00A39D), size: 20), const SizedBox(width: 15),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [Text('Inspirasi Hari Ini', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Color(0xFF00A39D))), SizedBox(height: 5), Text('"Perumpamaan orang yang menginfakkan hartanya di jalan Allah seperti sebutir biji yang menumbuhkan tujuh tangkai..."\n(QS. Al-Baqarah: 261)', style: TextStyle(fontSize: 11, color: Colors.black87, fontStyle: FontStyle.italic, height: 1.3))])),
          ],
        ),
      ),
    );
  }

  Widget _buildHelpCenterNote() {
    return Padding(padding: const EdgeInsets.only(top: 15, bottom: 5), child: Row(mainAxisAlignment: MainAxisAlignment.center, children: const [Icon(Icons.headset_mic, color: Color(0xFF00A39D), size: 14), SizedBox(width: 5), Text('Butuh bantuan? Hubungi BSI Call 14040', style: TextStyle(fontSize: 10, color: Color(0xFF00A39D), fontWeight: FontWeight.bold))]));
  }

  Widget _buildSecurityNote() {
    return Padding(padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 20), child: Row(mainAxisAlignment: MainAxisAlignment.center, children: const [Icon(Icons.security, color: Colors.grey, size: 14), SizedBox(width: 5), Expanded(child: Text('BSI tidak pernah meminta PIN, Kata Sandi, atau OTP Anda. Jaga selalu kerahasiaan data pribadi Anda.', textAlign: TextAlign.center, style: TextStyle(fontSize: 9, color: Colors.grey)))]));
  }

  Widget _buildQRISButton(BuildContext context) {
    return SizedBox(
      height: 75, width: 75,
      child: FloatingActionButton(
        backgroundColor: const Color(0xFF00A39D), elevation: 4,
        onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Membuka Kamera QRIS...'))),
        shape: const CircleBorder(side: BorderSide(color: Colors.white, width: 3)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: const [Icon(Icons.qr_code_scanner, color: Colors.white, size: 28), SizedBox(height: 2), Text('QRIS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white))]),
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xFFF8A83A), surfaceTintColor: Colors.transparent, shape: const CircularNotchedRectangle(), notchMargin: 8.0,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: _navItem(context, Icons.home_outlined, 'Beranda')), Expanded(child: _navItem(context, FontAwesomeIcons.mosque, 'Jadwal Sholat')),
            const SizedBox(width: 80), 
            Expanded(child: _navItem(context, Icons.chat_outlined, 'Pesan')), Expanded(child: _navItem(context, Icons.person_outline, 'Profil')),
          ],
        ),
      ),
    );
  }

  Widget _navItem(BuildContext context, IconData icon, String label) {
    return InkWell(
      onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Halaman $label dibuka!'))),
      child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, children: [Icon(icon, color: Colors.white, size: 22), const SizedBox(height: 4), Text(label, style: const TextStyle(color: Colors.white, fontSize: 10))]),
    );
  }
}