import 'package:flutter/material.dart';
import '../home/home_page.dart';

class MLSuccessPage extends StatelessWidget {
  final String game;
  final String playerId;
  final String nominal;
  final String payment;
  final String email;

  const MLSuccessPage({
    super.key,
    required this.game,
    required this.playerId,
    required this.nominal,
    required this.payment,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 60),

            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 90,
            ),

            const SizedBox(height: 16),

            const Text(
              'Transaksi Berhasil',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 32),

            _row('Game', game),
            _row('ID Player', playerId),
            _row('Nominal', nominal),
            _row('Pembayaran', payment),
            if (email.isNotEmpty) _row('Email', email),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const HomePage()),
                    (_) => false,
                  );
                },
                child: const Text('Kembali ke Beranda'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
