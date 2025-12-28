import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../success/pubgm_success_page.dart';

class PubGMTransactionPage extends StatefulWidget {
  final String nominal;
  final String price;

  const PubGMTransactionPage({
    super.key,
    required this.nominal,
    required this.price,
  });

  @override
  State<PubGMTransactionPage> createState() => _PubGMTransactionPageState();
}

class _PubGMTransactionPageState extends State<PubGMTransactionPage> {
  final idController = TextEditingController();
  final emailController = TextEditingController();

  String paymentMethod = 'OVO';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transaksi PUBG Mobile')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'PUBG Mobile',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text('${widget.nominal} • ${widget.price}'),

            const SizedBox(height: 16),

            TextField(
              controller: idController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Player ID',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            /// EMAIL (OPSIONAL)
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email (Opsional)',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            DropdownButtonFormField<String>(
              value: paymentMethod,
              decoration: const InputDecoration(
                labelText: 'Metode Pembayaran',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: 'OVO', child: Text('OVO')),
                DropdownMenuItem(value: 'DANA', child: Text('DANA')),
                DropdownMenuItem(value: 'Pulsa', child: Text('Pulsa')),
              ],
              onChanged: (value) {
                setState(() => paymentMethod = value!);
              },
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PubGMSuccessPage(
                        game: 'PUBG Mobile',
                        playerId: idController.text,
                        nominal: widget.nominal,
                        payment: paymentMethod,
                        email: emailController.text,
                      ),
                    ),
                  );
                },
                child: const Text('Bayar Sekarang'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
