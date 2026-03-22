import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuGrid extends StatelessWidget {
  const MenuGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final menus = [
      {'title': 'Info Rekening', 'icon': Icons.account_balance_wallet_outlined}, {'title': 'Transfer', 'icon': Icons.swap_horiz_outlined},
      {'title': 'Bayar', 'icon': Icons.payment_outlined}, {'title': 'Beli', 'icon': Icons.shopping_cart_outlined},
      {'title': 'Layanan Islami', 'icon': FontAwesomeIcons.moon}, {'title': 'Berbagi - Ziswaf', 'icon': FontAwesomeIcons.handHoldingHeart},
      {'title': 'e-mas', 'icon': Icons.monetization_on_outlined}, {'title': 'Favorit', 'icon': Icons.star_border_outlined},
      {'title': 'Tarik Tunai', 'icon': Icons.cloud_download_outlined}, {'title': 'Buka Rekening', 'icon': Icons.person_add_outlined},
      {'title': 'Top Up eWallet', 'icon': Icons.account_balance_outlined}, {'title': 'E-Commerce', 'icon': Icons.shopping_bag_outlined},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: GridView.builder(
        shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), itemCount: menus.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, mainAxisSpacing: 15, crossAxisSpacing: 10, childAspectRatio: 0.8),
        itemBuilder: (context, index) {
          return Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Menu ${menus[index]['title']} ditekan!'))),
              borderRadius: BorderRadius.circular(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Ink(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.15), spreadRadius: 1, blurRadius: 5)]), child: Icon(menus[index]['icon'] as IconData, color: const Color(0xFF00A39D), size: 30)),
                      Positioned(bottom: 4, right: 4, child: Container(width: 10, height: 10, decoration: const BoxDecoration(color: Color(0xFFF8A83A), shape: BoxShape.circle)))
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(menus[index]['title'] as String, textAlign: TextAlign.center, style: const TextStyle(fontSize: 10, color: Colors.black87, fontWeight: FontWeight.w600), maxLines: 2, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}