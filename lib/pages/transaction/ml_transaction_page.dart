import 'package:flutter/material.dart';
import 'package:game_topup_app/pages/success/transaction_success_page.dart';

class MLTransactionPage extends StatefulWidget {
  final String nominal;
  final String price;

  const MLTransactionPage({
    super.key,
    required this.nominal,
    required this.price,
  });

  @override
  State<MLTransactionPage> createState() => _MLTransactionPageState();
}

class _MLTransactionPageState extends State<MLTransactionPage> {
  final idController = TextEditingController();
  final zoneController = TextEditingController();
  final emailController = TextEditingController();

  String paymentMethod = 'OVO';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaksi Mobile Legends'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Nominal: ${widget.nominal}'),
            Text('Harga: ${widget.price}'),
            const SizedBox(height: 16),

            TextField(
              controller: idController,
              decoration: const InputDecoration(
                labelText: 'ID Player',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: zoneController,
              decoration: const InputDecoration(
                labelText: 'Zone ID',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email (Opsional)',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            DropdownButtonFormField<String>(
              value: paymentMethod,
              items: const [
                DropdownMenuItem(value: 'OVO', child: Text('OVO')),
                DropdownMenuItem(value: 'DANA', child: Text('DANA')),
                DropdownMenuItem(value: 'Pulsa', child: Text('Pulsa')),
              ],
              onChanged: (value) {
                setState(() => paymentMethod = value!);
              },
              decoration: const InputDecoration(
                labelText: 'Metode Pembayaran',
                border: OutlineInputBorder(),
              ),
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
                      builder: (_) => TransactionSuccessPage(
                        gameName: 'Mobile Legends',
                        playerId:
                            '${idController.text} (${zoneController.text})',
                        nominal: widget.nominal,
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
