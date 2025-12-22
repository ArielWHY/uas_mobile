import 'package:flutter/material.dart';

class TransactionSuccessPage extends StatelessWidget {
  final String gameName;
  final String playerId;
  final String nominal;

  const TransactionSuccessPage({
    super.key,
    required this.gameName,
    required this.playerId,
    required this.nominal,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaksi Berhasil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 80),
            const SizedBox(height: 16),

            Text(
              'Top Up $gameName Berhasil',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 24),

            Text('ID Player: $playerId'),
            Text('Nominal: $nominal'),

            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Text('Kembali ke Beranda'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
