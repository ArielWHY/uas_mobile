import 'package:flutter/material.dart';
import '../transaction/transaction_page.dart';

class FreeFirePage extends StatelessWidget {
  const FreeFirePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Free Fire Diamond'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          DiamondTile(
            nominal: '70 Diamond',
            price: 'Rp 10.000',
          ),
          DiamondTile(
            nominal: '140 Diamond',
            price: 'Rp 20.000',
          ),
          DiamondTile(
            nominal: '355 Diamond',
            price: 'Rp 50.000',
          ),
          DiamondTile(
            nominal: '720 Diamond',
            price: 'Rp 100.000',
          ),
          DiamondTile(
            nominal: '1450 Diamond',
            price: 'Rp 200.000',
          ),
        ],
      ),
    );
  }
}

class DiamondTile extends StatelessWidget {
  final String nominal;
  final String price;

  const DiamondTile({
    super.key,
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
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => TransactionPage(
                gameName: 'Free Fire',
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
