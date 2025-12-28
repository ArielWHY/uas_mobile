import 'package:flutter/material.dart';
import '../transaction/pubgm_transaction_page.dart';

class PubGMPage extends StatelessWidget {
  const PubGMPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PUBG Mobile UC')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _PUBGTile(nominal: '60 UC', price: 'Rp 15.000'),
          _PUBGTile(nominal: '325 UC', price: 'Rp 75.000'),
          _PUBGTile(nominal: '660 UC', price: 'Rp 150.000'),
          _PUBGTile(nominal: '1800 UC', price: 'Rp 375.000'),
        ],
      ),
    );
  }
}

class _PUBGTile extends StatelessWidget {
  final String nominal;
  final String price;

  const _PUBGTile({
    required this.nominal,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(nominal, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(price),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PubGMTransactionPage(
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
