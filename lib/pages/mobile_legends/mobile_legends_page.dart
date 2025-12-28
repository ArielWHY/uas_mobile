import 'package:flutter/material.dart';
import 'package:game_topup_app/pages/transaction/ml_transaction_page.dart';

class MobileLegendsPage extends StatelessWidget {
  const MobileLegendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Legends'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _MLDiamondTile(nominal: '86 Diamond', price: 'Rp 20.000'),
          _MLDiamondTile(nominal: '172 Diamond', price: 'Rp 40.000'),
          _MLDiamondTile(nominal: '257 Diamond', price: 'Rp 60.000'),
          _MLDiamondTile(nominal: '344 Diamond', price: 'Rp 80.000'),
          _MLDiamondTile(nominal: '514 Diamond', price: 'Rp 120.000'),
        ],
      ),
    );
  }
}

class _MLDiamondTile extends StatelessWidget {
  final String nominal;
  final String price;

  const _MLDiamondTile({
    required this.nominal,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(nominal),
        subtitle: Text(price),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => MLTransactionPage(
                nominal: nominal,
                price: price,
              ),
            ),
          );
        },
      ),
    );
  }
}
